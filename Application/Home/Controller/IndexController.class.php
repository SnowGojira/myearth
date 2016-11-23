<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index()
    {
        $special = [];
        $boost = [];
        $tour = [];

        //轮播
        $slide_info = D('Admin/Slide')->getSlideShowInfo();

        //项目介绍
        $proj_id = M('Category')->where(['name' => C('PROJ_INTRO')])->field('id')->find()['id'];
        $category = D('Category')->getTree($proj_id);
        foreach ($category["_"] as $cate)
        {
            switch ($cate['name'])
            {
                case C('SPECIAL_NAME'):
                    $special = D('Document')->lists($cate['id'], "`level` desc", 2);
                    break;
                case C('BOOST_NAME'):
                    $boost = D('Document')->lists($cate['id'], "`level` desc", 2);
                    break;
                case C('TOUR_NAME'):
                    foreach ($cate['_'] as $c)
                    {
                        $tour[] = D('Document')->lists($c['id'], "`level` desc", 1)[0];
                    }
                    break;
            }
        }

        //达人资讯
        $celeb_id = M('Category')->where(['name' => C('CATE_CELEB')])->field('id')->find()['id'];
        $conselling = D('Document')->lists($celeb_id, "`level` desc", 10);

//        var_dump($conselling);
        $this->assign('slide',$slide_info);//轮播
        $this->assign('special',$special);//轮播
        $this->assign('boost',$boost);//轮播
        $this->assign('tour',$tour);//轮播
        $this->assign('conselling',$conselling);//轮播
        $this->assign('page',D('Document')->page);//分页


        $this->display();
    }

}