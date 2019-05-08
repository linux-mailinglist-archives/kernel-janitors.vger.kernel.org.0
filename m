Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FA817441
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 10:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfEHIx4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 04:53:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38176 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfEHIx4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 04:53:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id v11so5956119wru.5
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2019 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=xV3M12FdNpL4/Lx8obmho0bS3Xjz6R4xytsasP5yzq4=;
        b=ZEjw+sco/pSIi93nELZMXMQYXRQUIkcAl5NVXjJRuBw8wVFrMD/OXp9XqEkRnM/zWO
         v/8eQgkC7iv2EKRaD2XgTUx5shPo5Gd1UWtDgnehrvKWMQfR1jR1ZWRZZxHd0RNvMOJ4
         snZkjl1Xy/PaywNsuFesblC9eeZ8pr+fftErSMvWAO6alCh2kPNtgVUHG5hDGgGepRqg
         1psiG5PbGzTWLLjgLI5I+j0zjwoZJ+1CAte/AiJQyjAN5+PHVz+6yXt2L8QkREjmsqGJ
         fdtulBy6v8HFEf68uQmD6aUbM/y7jTUtJqhIkTW6R44RZcpeoDQavtAuLK6XzrIhRdJa
         b8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding;
        bh=xV3M12FdNpL4/Lx8obmho0bS3Xjz6R4xytsasP5yzq4=;
        b=GGkQT8Nq8/4l3u86zJX/xop4750pf4IWC3mIZNyDJSyViyNRftynu+8Cr0wPJfRoWE
         jJIIJWf9PLWlP/ltBSIkSmrJXFg4wQxtkPJB9EnbJY3LBzermIyNxUXkEUTpbJO16zRE
         GcmLe+/liOw44KfyP1TcNNv4OGC3wiMqrWtVIM9kLdkOVSdc15Bw22Y5dfrcaOiH091X
         xddjKjYmOqlZkeVa4zTG3Pyem+m6/6lpU6Yx+FroCkMEpSV3/mJFPxvk0vyc4Z7SjLOA
         RHf/+9dBxctPDfjoBDyJ21EDiD1/PpqIFuriDLrRaWXurs9kfUEDaATwnHBE7VwmJP4H
         Dnuw==
X-Gm-Message-State: APjAAAUAF3faL7enK+QXBcblinrX9g1DMO6cdPDSSm2F70w3h4+QDpGT
        WP3LuPMsP1O9oKHe26fT/+IO1L/CKvE=
X-Google-Smtp-Source: APXvYqzQ3cOXPGuuiqaOenV1qbvFFcChJgSKlL5Z7MT8UdPEKWvRN7DVxrL4I8ih2ujrF6xmRRg6KQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr8000870wro.225.1557305634530;
        Wed, 08 May 2019 01:53:54 -0700 (PDT)
Received: from ?IPv6:2a00:23a8:4c11:1300:2830:9d5c:bf4b:72ae? ([2a00:23a8:4c11:1300:2830:9d5c:bf4b:72ae])
        by smtp.googlemail.com with ESMTPSA id i9sm2542901wmb.4.2019.05.08.01.53.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 01:53:53 -0700 (PDT)
Subject: Re: [bug report] net/sched: use the hardware intermediate
 representation for matchall
To:     Dan Carpenter <dan.carpenter@oracle.com>
References: <20190508071704.GA11889@mwanda>
 <6ce3bc18-94e8-298f-8ae5-1db9608ee575@netronome.com>
 <20190508081907.GX2239@kadam>
Cc:     kernel-janitors@vger.kernel.org
From:   Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>
Organization: Netronome
Message-ID: <34551f9c-279e-abe7-8843-0b68be563c07@netronome.com>
Date:   Wed, 8 May 2019 09:53:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190508081907.GX2239@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/05/2019 09:19, Dan Carpenter wrote:
> On Wed, May 08, 2019 at 08:41:13AM +0100, Pieter Jansen van Vuuren wrote:
>> On 08/05/2019 08:17, Dan Carpenter wrote:
>>> Hello Pieter Jansen van Vuuren,
>>>
>>> The patch f00cbf196814: "net/sched: use the hardware intermediate
>>> representation for matchall" from May 4, 2019, leads to the following
>>> static checker warning:
>>>
>>> 	net/sched/cls_matchall.c:317 mall_reoffload()
>>> 	error: double free of 'cls_mall.rule'
>>>
>>> net/sched/cls_matchall.c
>>>    286  static int mall_reoffload(struct tcf_proto *tp, bool add, tc_setup_cb_t *cb,
>>>    287                            void *cb_priv, struct netlink_ext_ack *extack)
>>>    288  {
>>>    289          struct cls_mall_head *head = rtnl_dereference(tp->root);
>>>    290          struct tc_cls_matchall_offload cls_mall = {};
>>>    291          struct tcf_block *block = tp->chain->block;
>>>    292          int err;
>>>    293  
>>>    294          if (tc_skip_hw(head->flags))
>>>    295                  return 0;
>>>    296  
>>>    297          cls_mall.rule = flow_rule_alloc(tcf_exts_num_actions(&head->exts));
>>>    298          if (!cls_mall.rule)
>>>    299                  return -ENOMEM;
>>>    300  
>>>    301          tc_cls_common_offload_init(&cls_mall.common, tp, head->flags, block,
>>>    302                                     extack);
>>>    303          cls_mall.command = add ?
>>>    304                  TC_CLSMATCHALL_REPLACE : TC_CLSMATCHALL_DESTROY;
>>>    305          cls_mall.cookie = (unsigned long)head;
>>>    306  
>>>    307          err = tc_setup_flow_action(&cls_mall.rule->action, &head->exts);
>>>    308          if (err) {
>>>    309                  kfree(cls_mall.rule);
>>>                         ^^^^^^^^^^^^^^^^^^^
>>>    310                  if (add && tc_skip_sw(head->flags)) {
>>>    311                          NL_SET_ERR_MSG_MOD(extack, "Failed to setup flow action");
>>>    312                          return err;
>>>    313                  }
>>>
>>> My guess is that there should be a "return err;" here?
>>
>> Thank you. Yes, I think this should be "return 0;" instead of "return err;"
> 
> You would know the code better, than I.  :)
> 
> Could you send a patch to Dave?  The merge window is open but he still
> accepts bug fixes.
> 
> regards,
> dan carpenter
> 

Will do. And thank you again.
