<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 优惠券模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class SlideModel extends Model{

    protected $_validate = array(


        array('title', 'require', '名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

        array('title', '', '名称已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),

    );

    protected $_auto = array(

        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),

    );

    /**
     * 获取优惠券详细信息
     * @param  milit   $id 优惠券ID或标识
     * @param  boolean $field 查询字段
     * @return array     优惠券信息
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function info($id, $field = true){
        /* 获取优惠券信息 */
        $map = array();
        if(is_numeric($id))
        { //通过ID查询
            $map['id'] = $id;
        }
        else
        {
            return false;
        }

        return $this->field($field)->where($map)->find();
    }


    /**
     * 更新优惠券信息
     * @return boolean 更新状态
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function update(){
        $data = $this->create();
        if(!$data){ //数据对象创建错误
            return false;
        }

        /* 添加或更新数据 */
        if(empty($data['id'])){
            $res = $this->add();
        }else{
            $res = $this->save();
        }

        //更新优惠券缓存
        S('sys_brand_list', null);

        //记录行为
        action_log('update_Slide', 'Slide', $data['id'] ? $data['id'] : $res, UID);

        return $res;
    }

    /*
     * $shop_id = null 表示在平台首页调用
     */
    public function getSlideShowInfo()
    {
        $ret = [];

        $map['status'] = ['eq', 1];
        $order = "`level` desc, `id` desc";

        if (null === ($infos = $this->where($map)->order($order)->field(true)->select()))
        {
            return false;
        }

        foreach ($infos as $info)
        {
            //组装url
            if (!empty($info['isStatic']))
            {
                $static_url = substr($info['staticName'], 0, -5);
                $tmp['page_url'] = U('Article/showStaticPage', "name=$static_url");
            }
            else if (empty($info['entity_id']))
            {
                $tmp['page_url'] = "#";
            }
            else
            {
                $tmp['page_url'] = U('Article/detail', "id=".$info['entity_id']);
            }
            //获取图片url
            $tmp['pic_url'] = M('Picture')->where(['id' => $info['cover_id']])->field('path')->find()['path'];
            $tmp['title_pic_url'] = get_cover($info['title_pic_id'], 'path');
            $tmp['title'] = $info['title'];

            $ret[] = $tmp;
        }

        return $ret;

    }
}
