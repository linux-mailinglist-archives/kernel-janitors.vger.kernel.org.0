Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1197C172C1
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 09:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfEHHlR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 03:41:17 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40623 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfEHHlR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 03:41:17 -0400
Received: by mail-wr1-f54.google.com with SMTP id h4so6541109wre.7
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2019 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=M5e0VRlB81VTWKEvyh2vuJ4T4uHhTVLV7c3YtR99IVg=;
        b=HqHg8INo2DbqABisMpn5aU5Y4p/12XitHSy1wr2Hx1eOAY2+gD8W/G+ITg6WQV/Gaj
         7gf4xySKDho1GgTJHurFG7UJkw/s76gR1tv28GvnO+p/1dD1Df0sxvw+32ZZtnCrG7KH
         9Op5GSq3W3Ga08ec3tbS8+3/+MKfOx0mY+7PeD1BgwXuJx2FAFqnbE/xzFg36HdFu17s
         SGjW+V22CIZ+vKzZFVdAn3Lcqp+shjI3MMbkjb37Xqu+o6IQdXvizuMg96/GKDrpR9TQ
         O9C1U8nyy5VtIpwumcGJl1pCtRxRBzxF9JeWqyPDCxu5TDnbizcQWsOvh88PtnRctyQi
         ZnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding;
        bh=M5e0VRlB81VTWKEvyh2vuJ4T4uHhTVLV7c3YtR99IVg=;
        b=iI8s2H8ZgJFMa6YVnmbHVw5baA0kHKJ3/VZ2hnd0S0U76CNeu70JnxxCmEcUOBaraG
         gW4ZOh3Cpd3c/Yk3e+W18BM0xZ9O7IfEcsFVZaqZx/IOgc1Sa687xZMqRdnSiprJkZ0Z
         ow0o0rdjhwkZhTulnsaghZu+O/W7NFipCR2OPjnDF/pq/7fHRWJOI/5E0/d7o0913QPN
         v6C13TyMfCPvgVsrU//smLFosaXyqeNHQ7FFO93MF7dksMtaScyBH8232wCUPeM6XpBI
         JGrsz2IiiL6hgHhhMoyEjWJ/4OU0mkUVLkK8eBjDFnC2k1PJs4VwWxpnWTc1jl1TG1/a
         QTiA==
X-Gm-Message-State: APjAAAUBbcDCaEF1bAt43vHcCwXw4ET3IFf6zhpun2CEQd5hBE4jFyVS
        V4xRzmWwe0/gMp11WA6LQqjy8yGeGyg=
X-Google-Smtp-Source: APXvYqzsglcHH6UWalnBcACXAnjBd2t/k5SRBz95B9WfElUHklpz8dmLxbgRH/j8fKA5kerU9H5mcQ==
X-Received: by 2002:adf:eb44:: with SMTP id u4mr19110436wrn.83.1557301275374;
        Wed, 08 May 2019 00:41:15 -0700 (PDT)
Received: from ?IPv6:2a00:23a8:4c11:1300:2830:9d5c:bf4b:72ae? ([2a00:23a8:4c11:1300:2830:9d5c:bf4b:72ae])
        by smtp.googlemail.com with ESMTPSA id h81sm6649100wmf.33.2019.05.08.00.41.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 00:41:14 -0700 (PDT)
Subject: Re: [bug report] net/sched: use the hardware intermediate
 representation for matchall
To:     Dan Carpenter <dan.carpenter@oracle.com>
References: <20190508071704.GA11889@mwanda>
Cc:     kernel-janitors@vger.kernel.org
From:   Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>
Organization: Netronome
Message-ID: <6ce3bc18-94e8-298f-8ae5-1db9608ee575@netronome.com>
Date:   Wed, 8 May 2019 08:41:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190508071704.GA11889@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/05/2019 08:17, Dan Carpenter wrote:
> Hello Pieter Jansen van Vuuren,
> 
> The patch f00cbf196814: "net/sched: use the hardware intermediate
> representation for matchall" from May 4, 2019, leads to the following
> static checker warning:
> 
> 	net/sched/cls_matchall.c:317 mall_reoffload()
> 	error: double free of 'cls_mall.rule'
> 
> net/sched/cls_matchall.c
>    286  static int mall_reoffload(struct tcf_proto *tp, bool add, tc_setup_cb_t *cb,
>    287                            void *cb_priv, struct netlink_ext_ack *extack)
>    288  {
>    289          struct cls_mall_head *head = rtnl_dereference(tp->root);
>    290          struct tc_cls_matchall_offload cls_mall = {};
>    291          struct tcf_block *block = tp->chain->block;
>    292          int err;
>    293  
>    294          if (tc_skip_hw(head->flags))
>    295                  return 0;
>    296  
>    297          cls_mall.rule = flow_rule_alloc(tcf_exts_num_actions(&head->exts));
>    298          if (!cls_mall.rule)
>    299                  return -ENOMEM;
>    300  
>    301          tc_cls_common_offload_init(&cls_mall.common, tp, head->flags, block,
>    302                                     extack);
>    303          cls_mall.command = add ?
>    304                  TC_CLSMATCHALL_REPLACE : TC_CLSMATCHALL_DESTROY;
>    305          cls_mall.cookie = (unsigned long)head;
>    306  
>    307          err = tc_setup_flow_action(&cls_mall.rule->action, &head->exts);
>    308          if (err) {
>    309                  kfree(cls_mall.rule);
>                         ^^^^^^^^^^^^^^^^^^^
>    310                  if (add && tc_skip_sw(head->flags)) {
>    311                          NL_SET_ERR_MSG_MOD(extack, "Failed to setup flow action");
>    312                          return err;
>    313                  }
> 
> My guess is that there should be a "return err;" here?

Thank you. Yes, I think this should be "return 0;" instead of "return err;"
