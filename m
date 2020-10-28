Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BEB29E074
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Oct 2020 02:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbgJ1WEv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 28 Oct 2020 18:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24262 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729494AbgJ1WCG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603922525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o9/CLvMtl/VDe8FAQKlYw2/08Jd6hZteFLUw3bqy7TU=;
        b=db12ESVBae3v4+CsABMTMO7X5KyT2VlO8gDHQAzB1e7G5DHjXiYCs5UMtIDQTjlC3xvG4R
        FiHhEMOm1QfoSLF4UF/MTSRwZuGC1boZ58EWWtQlhFE/WSWvfN+wo2e1SZX0Yi1AfDysl4
        MWfs9fEWRNMElmZSCY7Cgwst35X7Rmk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-SxOUnjtxMPqxritbDpEL7Q-1; Wed, 28 Oct 2020 09:59:07 -0400
X-MC-Unique: SxOUnjtxMPqxritbDpEL7Q-1
Received: by mail-oi1-f200.google.com with SMTP id l142so2263151oig.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Oct 2020 06:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o9/CLvMtl/VDe8FAQKlYw2/08Jd6hZteFLUw3bqy7TU=;
        b=YohG12sJCezUS1+mCTD5CxUgVa3FwwEh99t/kJvzILygZMW6DUMzhlXgu5SlWGffmN
         MHL6eGOem7M1LA/k6A9nwSBY7Upg5mVnormcagOnfdXvuecSvFy44AgpvDcRg7kWBLEI
         82dAQLp5j6wXsTMiTqdbGDBIwbEt3NjefDlgh1q3KUoh6GgOtVVFk2mD+U6n+tvTpLn1
         EY/f+QU+UJ/JwAYNTc0vrwg4rYZ7FTJ06T0+EtKGsFTRRGfaw0TkN7B11aKkpJjc4PRc
         j7t5eIe/m1Ed8Z7mETX0tqwb8+lDP2Xr463niUHtemnXhvRftNl/r7JUbW5rzcLMJxha
         RZFw==
X-Gm-Message-State: AOAM532BAK4TKbfxqkoo7UXvkr+LFUq8GLP41y8f4yrk7dbmes1nrMSM
        Te1f0I7kK5+bhvecM6qyMbuTu5Xu3MXdG67qU6j1Ff57lbstg8dgKPCJ3/oR+lLPoAKtLKP//Th
        CwTnhxHO/ipOveZbhfOzofo6Ba0/u
X-Received: by 2002:a05:6830:1009:: with SMTP id a9mr3705432otp.312.1603893546067;
        Wed, 28 Oct 2020 06:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeg7tSjhUnhor6fkPxapZ8CezKup/neyZauptgkF/vARmTGWA1Kn0lF3+D4cF2Xma1oQSK6Q==
X-Received: by 2002:a05:6830:1009:: with SMTP id a9mr3705422otp.312.1603893545799;
        Wed, 28 Oct 2020 06:59:05 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c20sm2031463otm.49.2020.10.28.06.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 06:59:05 -0700 (PDT)
Subject: Re: [PATCH] net: cls_api: remove unneeded local variable in
 tc_dump_chain()
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech
References: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <d956a5a5-c064-3fd4-5e78-809638ba14ef@redhat.com>
Date:   Wed, 28 Oct 2020 06:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028113533.26160-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 10/28/20 4:35 AM, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
>
> net/sched/cls_api.c:2964:3: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                 parent = 0;
>                 ^
>
> net/sched/cls_api.c:2977:4: warning: Value stored to 'parent' is never read
>   [clang-analyzer-deadcode.DeadStores]
>                         parent = q->handle;
>                         ^
>
> Commit 32a4f5ecd738 ("net: sched: introduce chain object to uapi")
> introduced tc_dump_chain() and this initial implementation already
> contained these unneeded dead stores.
>
> Simplify the code to make clang-analyzer happy.
>
> As compilers will detect these unneeded assignments and optimize this
> anyway, the resulting binary is identical before and after this change.
>
> No functional change. No change in object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201028
>
> Jamal, Cong, Jiri, please ack.
> David, Jakub, please pick this minor non-urgent clean-up patch.
>
>  net/sched/cls_api.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
> index faeabff283a2..8ce830ca5f92 100644
> --- a/net/sched/cls_api.c
> +++ b/net/sched/cls_api.c
> @@ -2940,7 +2940,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  	struct tcf_chain *chain;
>  	long index_start;
>  	long index;
> -	u32 parent;
>  	int err;
>  
>  	if (nlmsg_len(cb->nlh) < sizeof(*tcm))
> @@ -2955,13 +2954,6 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		block = tcf_block_refcnt_get(net, tcm->tcm_block_index);
>  		if (!block)
>  			goto out;
> -		/* If we work with block index, q is NULL and parent value
> -		 * will never be used in the following code. The check
> -		 * in tcf_fill_node prevents it. However, compiler does not
> -		 * see that far, so set parent to zero to silence the warning
> -		 * about parent being uninitialized.
> -		 */
> -		parent = 0;
>  	} else {
>  		const struct Qdisc_class_ops *cops;
>  		struct net_device *dev;
> @@ -2971,13 +2963,11 @@ static int tc_dump_chain(struct sk_buff *skb, struct netlink_callback *cb)
>  		if (!dev)
>  			return skb->len;
>  
> -		parent = tcm->tcm_parent;
> -		if (!parent) {
> +		if (!tcm->tcm_parent)
>  			q = dev->qdisc;
> -			parent = q->handle;

This looks like a an unused error handler.

and the later call to

if (TC_H_MIN(tcm->tcm_parent)

maybe should be

if (TC_H_MIN(parent))

so I am skeptical that this change is ok because the code around it looks buggy.

Tom

> -		} else {
> +		else
>  			q = qdisc_lookup(dev, TC_H_MAJ(tcm->tcm_parent));
> -		}
> +
>  		if (!q)
>  			goto out;
>  		cops = q->ops->cl_ops;

