<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ContactController extends HomeController
{

    public function recv()
    {
        if (empty(I('post.name')) || empty(I('post.tel')) || empty(I('post.mail')) || empty(I('post.info')))
        {
            $this->error("请完善信息");
        }

        $_POST['create_time'] = time();
        $_POST['status'] = 1;

        D('Contact')->create();
        $ret = D('Contact')->add();

        if(!$ret){
            $this->error(D('Contact')->getError());
        }else{
            $this->success('发布成功', U('Index/index'));
        }
    }
}