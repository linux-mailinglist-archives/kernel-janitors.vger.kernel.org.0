Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE280779F6D
	for <lists+kernel-janitors@lfdr.de>; Sat, 12 Aug 2023 13:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbjHLLCj (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 12 Aug 2023 07:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237157AbjHLLCi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Aug 2023 07:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0830A113
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Aug 2023 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691838117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hUQODfZCQSly3skRl2EdqxgNTUVNaeM4NYBujWjSHHY=;
        b=VDuORCYnU3CaQMgcw92Oe9ButDgK1dTRVDf31DH2e7BdNsDzNiaCPUrF1M1IrKmePh/ZBO
        nE+vDfquaWWiiSPuzxp1cwija0kXbrwFuatlyCWRaljoiAZLY0vp9syv/TKdcbBB5Lw+af
        UvLrwMdzW7cM7Z7A15kB2UvmVy3E3Do=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-Sc-mJRvhNmuNE6381Lv12A-1; Sat, 12 Aug 2023 07:01:55 -0400
X-MC-Unique: Sc-mJRvhNmuNE6381Lv12A-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b9d0b3a572so29943001fa.1
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Aug 2023 04:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691838114; x=1692442914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUQODfZCQSly3skRl2EdqxgNTUVNaeM4NYBujWjSHHY=;
        b=dTVPyzReNxO7ELmBHpiQXjtt5/lC6RJuxyV8np2v+bj1skobWgM5f9P2RMBCyeGTJF
         5qC2yU6NH+JpJckrUjplmsYPVN+CzR+NJZcoZ+/hWBwoq6rm7Mr4kkswDlk2ou7RIPtT
         MzTSzHntlubonQ2N5jHd+qRgcRCnU7Jbi8AWWuyko/CPdQy8nTx+firnXohhF26HcE0b
         BR3YnJ2DE5xWlSy0F5H4WaUL6lI6QkmRJvavvazypqH9MNHSYPArUH520e5v60gDnO7K
         lRCw5abdulWP5hkKp7iG6acKJhLBpvU4aoonLwnx5B4xBoxN2YsxJcxFntP0kn8evS6J
         cwqA==
X-Gm-Message-State: AOJu0Yxgn3srf+SAfCZogJgsKaEy18TWSom9XgVExwrDR9guDltXF05K
        FOw7am3MaJwgaiqg9rEvtMks1FNYpyr6bkQf7fR7HajFiwN+ngJf9w9G3U3gCe0JWF9bqchyULw
        eKQatxJa29OWIKswRhTCz6B5xc4mW
X-Received: by 2002:a2e:6a10:0:b0:2b6:e361:4b3c with SMTP id f16-20020a2e6a10000000b002b6e3614b3cmr3340989ljc.14.1691838114319;
        Sat, 12 Aug 2023 04:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkmLxJ4rN4icCeOX6whnRxHTUgwxoqhAMuMSHLlrs8YdydySDT+7hEsYkmxBnP8IpH5ltPg==
X-Received: by 2002:a2e:6a10:0:b0:2b6:e361:4b3c with SMTP id f16-20020a2e6a10000000b002b6e3614b3cmr3340972ljc.14.1691838114002;
        Sat, 12 Aug 2023 04:01:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id si28-20020a170906cedc00b00988dbbd1f7esm3315334ejb.213.2023.08.12.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 04:01:53 -0700 (PDT)
Message-ID: <f332c309-795e-195b-9b77-1e2902938cec@redhat.com>
Date:   Sat, 12 Aug 2023 13:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: atomisp: csi2-bridge: check for negative port
 values
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
References: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 8/5/23 08:53, Dan Carpenter wrote:
> The atomisp_csi2_get_port() function reads an integer value from the
> firmware.  We check for invalid positive values but we should also
> check for negatives.
> 
> Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 46d9f31986c9..0f0ec5d7e49d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -626,7 +626,7 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
>  			goto err_put_adev;
>  
>  		sensor->port = atomisp_csi2_get_port(adev, clock_num);
> -		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
> +		if (sensor->port < 0 || sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
>  			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
>  			ret = -EINVAL;
>  			goto err_put_adev;

Thank you for the fix, this code has been refactored in -next and now it uses sensor->link rather then sensor->port with sensor now being a 'struct ipu_sensor *' and link being a 'u8' so checking for < 0 no longer is necessary.

Regards,

Hans



