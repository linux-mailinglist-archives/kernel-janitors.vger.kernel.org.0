Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8526BCF5C
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Mar 2023 13:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjCPMZe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Mar 2023 08:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjCPMZb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Mar 2023 08:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB32E85682
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Mar 2023 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678969485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tGtAxHTpwhqk1MF3FY7AMDANiX6ih0L2CASPGlsjh3s=;
        b=DpHgscPJ1HmkFvksvk+q+/K2PVnHBY1x0J9zm9Hr/8ycuP8iwX0Ic5BhEzRc3bqxIQokmF
        UX+3PGG6B11ltwvGyxSKJbtej122DibjURatfSdV2K/OicoZP9hROr87t9nviPUUM/ZxiB
        xCFsA17Cq139vIQVxn8iA4ir0jwsYi0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-e5dZkpkMObi9fFcdoiX4Qw-1; Thu, 16 Mar 2023 08:24:43 -0400
X-MC-Unique: e5dZkpkMObi9fFcdoiX4Qw-1
Received: by mail-ed1-f72.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so2801968edb.21
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Mar 2023 05:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGtAxHTpwhqk1MF3FY7AMDANiX6ih0L2CASPGlsjh3s=;
        b=QR8iN6BtKqvg9pf6Q6lAZ57EH4LRvBzMx5hioW0aq3hawIzeqL9xUvmlS/5NRbNgx6
         WIZezcX2O0DGS3iDyl/d7jG/BT9DASyIbRFKuG71bxYdrRddQChVHgnocBwSis54L7WW
         U1Y5KBLQvm5H29JXGhtFWNMtg9ZeY0JcmvTjaoncUDlic77xloPX0Rm3hR8mJELYZ+jC
         YIHhV3xM542cQtbpDWhyvNhWr7At2iTxo1mZ+4TLqSZH1tSgL8J70TU5ExkPw6asjNcr
         4gV3cCisiX/cIYHId1Rrkm5hdL2sV+qxFnblVw/c+6jMB7WSeBYInmTpJNJyVL8ufpxe
         X8Dw==
X-Gm-Message-State: AO0yUKVXPeDKGrZ1uUVP1EO/Iexy+3HxB+pr08FXBENgFMOBfKuX1xBe
        i2ozYkLoO21oRbEjGuJR3YpN13YAdi2lgOZvXZBwENK7n7aIhteb/ccB8FrYbJ4KjTTKPxpq7+w
        /O/dotoXqqCU4fPJ14cpQSdXARJFp
X-Received: by 2002:a17:906:684f:b0:905:a46b:a725 with SMTP id a15-20020a170906684f00b00905a46ba725mr2404667ejs.16.1678969482829;
        Thu, 16 Mar 2023 05:24:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set9CJC8m64MpLfR95218nEK90up6Y5N372dSWgwbA4FFvYEVUUhPR3NXyYyQGPFr5ECoSsEaTg==
X-Received: by 2002:a17:906:684f:b0:905:a46b:a725 with SMTP id a15-20020a170906684f00b00905a46ba725mr2404652ejs.16.1678969482598;
        Thu, 16 Mar 2023 05:24:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u20-20020a17090617d400b0092be4b381b7sm3768638eje.81.2023.03.16.05.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:24:42 -0700 (PDT)
Message-ID: <ec1ffb3a-178e-6bba-2e54-350fb659a03f@redhat.com>
Date:   Thu, 16 Mar 2023 13:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: apple-gmux: return -EFAULT if copy fails
Content-Language: en-US, nl
To:     Dan Carpenter <error27@gmail.com>,
        Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <0bdfa8c2-cb22-4bec-8773-584060613043@kili.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0bdfa8c2-cb22-4bec-8773-584060613043@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 3/10/23 13:31, Dan Carpenter wrote:
> The copy_to/from_user() functions return the number of bytes remaining
> to be copied, but we want to return -EFAULT to the user.
> 
> Fixes: ce3fef2eb235 ("platform/x86: apple-gmux: add debugfs interface")
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
>  drivers/platform/x86/apple-gmux.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 787cf2a7e268..77e63d2da7b6 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -694,7 +694,6 @@ static ssize_t gmux_selected_port_data_write(struct file *file,
>  		const char __user *userbuf, size_t count, loff_t *ppos)
>  {
>  	struct apple_gmux_data *gmux_data = file->private_data;
> -	int ret;
>  
>  	if (*ppos)
>  		return -EINVAL;
> @@ -702,16 +701,16 @@ static ssize_t gmux_selected_port_data_write(struct file *file,
>  	if (count == 1) {
>  		u8 data;
>  
> -		ret = copy_from_user(&data, userbuf, 1);
> -		if (ret)
> -			return ret;
> +		if (copy_from_user(&data, userbuf, 1))
> +			return -EFAULT;
> +
>  		gmux_write8(gmux_data, gmux_data->selected_port, data);
>  	} else if (count == 4) {
>  		u32 data;
>  
> -		ret = copy_from_user(&data, userbuf, 4);
> -		if (ret)
> -			return ret;
> +		if (copy_from_user(&data, userbuf, 4))
> +			return -EFAULT;
> +
>  		gmux_write32(gmux_data, gmux_data->selected_port, data);
>  	} else
>  		return -EINVAL;

