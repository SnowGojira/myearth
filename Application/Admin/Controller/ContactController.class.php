<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 行为控制器
 * @author huajie <banhuajie@163.com>
 */
class ContactController extends AdminController {

    public function index()
    {
        $cut_len = 40;

        $list = M('Contact')->where(['status' => 1])->field(true)->select();

        foreach($list as $k => $v)
        {
            if (strlen($list[$k]['info']) > 3 * $cut_len)
            {
                $list[$k]['info'] = mb_substr($v['info'], 0, 40) . "...";
            }
        }

        $this->assign('list', $list);
        $this->display();
    }

    public function info()
    {
        $id = I('get.id');

        $info = M('Contact')->where(['id' => $id])->field(true)->find();

        $this->assign('info', $info);
        $this->display();

    }

    public function del()
    {
        $id = I('get.id');

        $ret = M('Contact')->where(['id' => $id])->save(['status' => -1]);

        if ($ret === false)
        {
            $this->success('删除失败');
        }
        else
        {
            $this->success('删除成功');
        }
    }
}