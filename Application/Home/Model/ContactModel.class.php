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


class ContactModel extends Model
{

    protected $_validate = array(

        array('name', 'require', '名字不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('tel', 'require', '电话不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('mail', 'require', '邮箱不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('info', 'require', '留言不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),


    );

    protected $_auto = array(

        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('status', 1, self::MODEL_INSERT),

    );
}