<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
require_once VENDOR_PATH . "/email.class.php";

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ContactController extends HomeController
{

    public function recv()
    {
        $name = I('post.name');
        $tel = I('post.tel');
        $mail = I('post.mail');
        $info = I('post.info');

        if (empty($name) || empty($tel) || empty($mail) || empty($info))
        {
            $this->error("请完善信息");
        }

        $_POST['create_time'] = time();
        $_POST['status'] = 1;

        D('Contact')->create();
        $ret = D('Contact')->add();

        $stat = $this->sendMail2Admin($name, $tel, $mail, $info);

        if (empty($stat))
        {
            $this->error("发送邮件失败" . json_encode($stat));
        }

        if(!$ret){
            $this->error(D('Contact')->getError());
        }else{
            $this->success('发布成功', U('Index/index'));
        }
    }

    public function sendMail2Admin($name, $tel, $mail, $info)
    {
        $user = M("ucenter_member")->where(['id' => 1])->find();

        $smtpserver = $user['smtp_server'];//SMTP服务器
        $smtpserverport =25;//  SMTP服务器端口
        $smtpusermail = $user['smtp_user'];//SMTP服务器的用户邮箱
        $smtpuser = $user['smtp_user'];//SMTP服务器的用户帐号
        $smtppass = $user['smtp_pwd'];//SMTP服务器的用户密码


        $smtpemailto = $user['email'];//发送给谁
        $mailtitle = "一条来自【" . $name . "】的留言";//邮件主题
        $mailcontent = "用户：" . $name . "<br/>";
        $mailcontent .= "联系方式：" . $tel . "<br/>";
        $mailcontent .= "邮箱：" . $mail . "<br/><br/>";
        $mailcontent .= $info;//邮件内容
        $mailtype = "HTML";//邮件格式（HTML/TXT）,TXT为文本邮件

        $smtp = new \smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);

        $smtp->debug = false;

        $state = $smtp->sendmail($smtpemailto, $smtpusermail, $mailtitle, $mailcontent, $mailtype);

        return $state;
    }

}