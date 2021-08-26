Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B97E3F88A3
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Aug 2021 15:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242551AbhHZNTp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Aug 2021 09:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242341AbhHZNTg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 09:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629983928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AeJY4uWzCABawf4ZbixV2+0MN+zGVDJXlDf8jzwd11c=;
        b=XFCsO+paXOsOYwMss0UX+/zTCzXElqaKs4Zk3vRvnLq3+aWIdrBf+nlGWmE4wwOKtwmGXi
        ttpeOlx1xYYb3NYcXXL0kxQaZNZHcUpqXy1DeJxu7fdwqXc1Jrpi/xjs9jUGikCVQC6Slc
        bMEdPSHz8OCfRzrEGMBbQbBEkCvyCxI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-MTd7iU5cM2upMO3sK2pB0A-1; Thu, 26 Aug 2021 09:18:47 -0400
X-MC-Unique: MTd7iU5cM2upMO3sK2pB0A-1
Received: by mail-ej1-f69.google.com with SMTP id gg1-20020a170906e281b029053d0856c4cdso1168142ejb.15
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 06:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AeJY4uWzCABawf4ZbixV2+0MN+zGVDJXlDf8jzwd11c=;
        b=AnjcPWxcbaXPfeL9u6jyR8v8CftY25w62vjk0/PxJ3Z8Fhki3U60MQpHR99pQhN3dW
         k5VMaGg9llHLxqapwROWLP6krBvmJlr60DV2qU6w7M9zmU3Dn52qgKe1/kaCR9jmmknW
         okIeAf8Li24C+S9AdVmvHZuu0BHNIKz+eWROfQelYD94Wh9aIz7YFo1GH4TFkKf2eHDT
         0Vqe5uZ+Ddp0NAeXo63JWxInVaGM/uS5cKp2UwmKzSbqA/wGoWG+YHn6CTsBuSDfbYh7
         nEjbYlrvmeVEmgjcoPzcfHtaUN3EPGYWGl/Nlc40DWAA6kPAdn/iD4m5Tj+A6Akk0jTK
         Gklw==
X-Gm-Message-State: AOAM531uEadXtGFWLSr92WugW5OoozmDUdZxhlp3AgnH6tzyWncpG0I4
        OT6KB7eZvmHF7+EDb8Vw0vKrplvKFnP9QAQC3asW8wWPthfnF5UAHk0kTKDl1bGaton1A83XxA8
        1o3IAPE0ZbPTe3AjRha6fmJgsATfsBXG9xlVRKlkVxHS9ZPIJCZ6k/anTnHNsjTxbb0lQR/0r8P
        ZLsbx6
X-Received: by 2002:a05:6402:18ec:: with SMTP id x44mr4244188edy.331.1629983925959;
        Thu, 26 Aug 2021 06:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0X3Esc06i+Mi9e86vh5yakOKVggNelNdzjsF9q/36McaFl3K6G/4NcEcp1LmGk6WPXsDpWQ==
X-Received: by 2002:a05:6402:18ec:: with SMTP id x44mr4244165edy.331.1629983925733;
        Thu, 26 Aug 2021 06:18:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q9sm1410462ejf.70.2021.08.26.06.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:18:44 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: ISST: use semi-colons instead of commas
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210825072357.GA12957@kili>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <672791e3-0e54-1b8d-4c56-f4bae0a8537d@redhat.com>
Date:   Thu, 26 Aug 2021 15:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825072357.GA12957@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 8/25/21 9:23 AM, Dan Carpenter wrote:
> The code works the same either way, but it's better to use semi-colons
> to separate statements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> index 8a4d52a9028d..c9a85eb2e860 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> @@ -265,9 +265,9 @@ static int isst_if_get_platform_info(void __user *argp)
>  {
>  	struct isst_if_platform_info info;
>  
> -	info.api_version = ISST_IF_API_VERSION,
> -	info.driver_version = ISST_IF_DRIVER_VERSION,
> -	info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT,
> +	info.api_version = ISST_IF_API_VERSION;
> +	info.driver_version = ISST_IF_DRIVER_VERSION;
> +	info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT;
>  	info.mbox_supported = punit_callbacks[ISST_IF_DEV_MBOX].registered;
>  	info.mmio_supported = punit_callbacks[ISST_IF_DEV_MMIO].registered;
>  
> 

