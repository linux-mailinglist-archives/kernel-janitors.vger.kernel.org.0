Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3906CA571
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 Mar 2023 15:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjC0NTy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 Mar 2023 09:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjC0NTv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Mar 2023 09:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493841985
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679923145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EBgTYwgbbPBXMkcZFKPAHeZP7Jqx47wA107Cj1PA/QY=;
        b=fEFM3kVGrzVCuB6nrPh5YBFkn/cbPx0B1ZyBPDi34QqpuNXWvgHOA11warVcXwZQQ7zCqc
        C/IdIGtLX4h2K2wqlfFSiBMz5WfvD+wH2A0g1gxDEyR8kcOLunJwyp197EUr/lPJpeo/pD
        9vxcGc0bBAA70fLR/93/3sMVj/uLlnw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-j84r8jUxMU6CtnYptjvayg-1; Mon, 27 Mar 2023 09:19:04 -0400
X-MC-Unique: j84r8jUxMU6CtnYptjvayg-1
Received: by mail-ed1-f69.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso12814101edh.15
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Mar 2023 06:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBgTYwgbbPBXMkcZFKPAHeZP7Jqx47wA107Cj1PA/QY=;
        b=ychX/wDpzqkaMjEGW29zxtKy1yw5ZC5L0L1EZg2Zu+79//eeeWOIibIWXJnHFz8RWQ
         GkYHiK+PvK06kA+5MqLRh2Jmw7ECcY7GD0mXGUa27UdHXGEr+VKCkmUU8+9NMbHniRHF
         SIl3/sPM7PPNXhCRagOXE0Yuleft7pO49lVuvDaIkieCx3It48byBtPvmxnfJwUxmymM
         yp8cPPfJo762G2hsD52FYiVtmOnABFqdPHFQmHE24J72r6V3D6hRbrxu3Xvh3VaLxtN3
         S5j3M4cvbXxgbYhqFhviXJEUDNJANEz9L4+aodNdemO1Li5ImqfhBFMlKqP4yTNSJMZZ
         vZeg==
X-Gm-Message-State: AAQBX9f1MOiwaue264nmp1Xf8VCguqo2Nb7hhEV0GwuwMSh3NUI0Jytx
        EpfGKYHrVN2UletbsBXVJ31awp6DlPFtwlLdjmeiaJz3je4eljTNjeF+7EF2W0zWQps1s0zdnEJ
        S5oQdeHyvbvUsk0oX7hTyRc5Ku5FH
X-Received: by 2002:a17:907:7718:b0:93d:c57f:b8b4 with SMTP id kw24-20020a170907771800b0093dc57fb8b4mr11701398ejc.26.1679923143157;
        Mon, 27 Mar 2023 06:19:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8Affwbtww/oGzsLGTsjSTqCH5Zk+CjaVKRD6uvWJLEqdhLBKHVDkMb0S7T1uIFwf8Xha+PQ==
X-Received: by 2002:a17:907:7718:b0:93d:c57f:b8b4 with SMTP id kw24-20020a170907771800b0093dc57fb8b4mr11701385ejc.26.1679923142910;
        Mon, 27 Mar 2023 06:19:02 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h27-20020a17090634db00b00933f31034f2sm11292321ejb.38.2023.03.27.06.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:19:02 -0700 (PDT)
Message-ID: <a4ddfdeb-aa17-2e72-9c1d-5a7207ee8e47@redhat.com>
Date:   Mon, 27 Mar 2023 15:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: ISST: unlock on error path in
 tpmi_sst_init()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <dcdebbb7-7de6-4d04-8e7a-43d5ca043484@kili.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dcdebbb7-7de6-4d04-8e7a-43d5ca043484@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 3/25/23 12:08, Dan Carpenter wrote:
> Call mutex_unlock(&isst_tpmi_dev_lock) before returning on this
> error path.
> 
> Fixes: d805456c712f ("platform/x86: ISST: Enumerate TPMI SST and create framework")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index cdb56a18ea17..664d2ee60385 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1399,8 +1399,10 @@ int tpmi_sst_init(void)
>  	isst_common.sst_inst = kcalloc(topology_max_packages(),
>  				       sizeof(*isst_common.sst_inst),
>  				       GFP_KERNEL);
> -	if (!isst_common.sst_inst)
> -		return -ENOMEM;
> +	if (!isst_common.sst_inst) {
> +		ret = -ENOMEM;
> +		goto init_done;
> +	}
>  
>  	memset(&cb, 0, sizeof(cb));
>  	cb.cmd_size = sizeof(struct isst_if_io_reg);

