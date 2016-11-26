<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
 * @author 烟消云散 <1010422715@qq.com>
 */
class SlideController extends AdminController
{

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index()
    {
        /* 查询条件初始化 */

        $map['status']  = array('egt', 1);
        if(IS_GET)
        {
            $title=trim(I('get.title'));
            $map['title'] = array('like',"%{$title}%");
            $list   =   M("Slide")->where($map)->field(true)->order('id desc')->select();
        }
        else
        {
            $list = $this->lists('Slide', $map,'id desc');
        }

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->meta_title = '优惠券幻灯片';
        $this->display();
    }


    /* 编辑分类 */
    public function edit($id = null)
    {
        $slide = D('slide');

        if(IS_POST)
        { //提交表单

            //参数合法性判断
            if(strpos($_POST['url'], 'Custom') && $_POST['shopid'] == 0)
            {
                $this->error("商品轮播不支持所有商店");
            }

            if(false !== $slide->update())
            {
                $this->success('编辑成功！', U('index'));
                exit;
            }
            else
            {
                $error = $slide->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {

            /* 获取分类信息 */
            $info = $id ? $slide->info($id) : '';
            $this->assign('info',       $info);
            $this->meta_title = '编辑幻灯片';
            $this->display();
        }
    }


    /* 新增分类 */
    public function add(){
        $slide = D('slide');
        if(IS_POST){ //提交表单
//            $good=$_POST["entity_id"];
            //默认位置--首页
            $_POST["pos"] = 1;
            if(false !== $slide->update()){

                $this->success('新增成功！', U('index'));
            }
            else
            {
                $error = $slide->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        }
        else
        {
//            $cate_shop_name = C('MARKET_CATE_TAG');
//            $pid = M('Category')->where(array('name' => $cate_shop_name))->field('id')->find()['id'];
//            $shop_info = M('Category')->where(array('pid' => $pid, 'status' => 1))->field('id, title')->select();

            /* 获取优惠券信息 */
//            $this->assign('info', null);
//            $this->assign('shop_info',       $shop_info);
            $this->meta_title = '新增幻灯片';
            $this->display('edit');
        }
    }



    public function del(){
        if(IS_POST){
            $ids = I('post.id');
            $order = M("bfcoupon");

            if(is_array($ids)){
                foreach($ids as $id){
                    $order->where("id='$id'")->delete();
                }
            }
            $this->success("删除成功！");
        }
        else
        {
            $id = I('get.id');
            $db = M("slide");
            $status = $db->where("id='$id'")->delete();
            if ($status)
            {
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        }
    }

}