Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDB5318B94
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Feb 2021 14:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbhBKNHM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 08:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37120 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231263AbhBKNEx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 08:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613048600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RgYeth96asLjSdxqzX+bicEvZRy6cX+sEf+GmW7KKqo=;
        b=ORg0PAcg5kQCXn1E5bxh3j8tx8oO0RtwsSzFkzUj/VkPWtPuHDU/GZbc/fZC77+gooxi1W
        Jm+mvfpyv81nora86onnMDN7A9v0WYP67YyES4KsxXGoeRgFy4OTngAkwi6/U46Ec3Ss5o
        HOTEvqmoJ9YeWx3SkcoOw9FPQAP4j/I=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-4BGpGgpjMdC2bKSlfH95dQ-1; Thu, 11 Feb 2021 08:03:19 -0500
X-MC-Unique: 4BGpGgpjMdC2bKSlfH95dQ-1
Received: by mail-pl1-f198.google.com with SMTP id z9so3942083plg.19
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Feb 2021 05:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RgYeth96asLjSdxqzX+bicEvZRy6cX+sEf+GmW7KKqo=;
        b=qs8gMUDfA3Z1tA/q7FjAjedSZhpn3XQXEs4TJZtJ4GDjSOPEbHjXtIYFHonJH3S151
         mRH91h60qOH82YYwVA4ODCfysdfj4SgS6Lv245/hzPmZW4R1RCneXOdRHEbHbnaZHM+4
         9R1NPEFtZG9uNgE2X1Ed6p2borTOTUeiZsTuSZfj84BTgucoAO3/Eauy45FmGg8TzNqe
         paWvc7R0koJaaf81NelZ9uUtYrS/0zxzw+nmYP+Om+rQeE7US9UySZizaGB3FLv58/MW
         CCTDNoQcpo7I8hiSQaxIq00mdmJScrJW4WXteTVG6zAZpQGHItknF7QGQrDywcVQBSM7
         tsBw==
X-Gm-Message-State: AOAM533mkQ0ZFs7oUCp0BfXLGBEMWM1ZW7pgQ6am+P5tLdllrv5W1/45
        FkzrwThVJaLMyT2OPTSEHRSKVDK58Tv3KsbIuH9zviA1UVgY67LVXAIqr1WU4eCcQioaAEAW8xo
        FTN+JMYYMDHYWaX2Y83R+UPIji33j
X-Received: by 2002:a17:90a:6048:: with SMTP id h8mr3965510pjm.139.1613048597683;
        Thu, 11 Feb 2021 05:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1WIDQt5WM+CZCT8YfL5YV4V4piqMpArUu6Zp1IVhq68pCRGfD0UjmYYQ7P98JAgczop3cQQ==
X-Received: by 2002:a17:90a:6048:: with SMTP id h8mr3965485pjm.139.1613048597351;
        Thu, 11 Feb 2021 05:03:17 -0800 (PST)
Received: from [172.24.0.1] ([171.50.216.159])
        by smtp.gmail.com with ESMTPSA id h11sm4994767pjg.46.2021.02.11.05.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 05:03:16 -0800 (PST)
Subject: Re: [PATCH] scsi: qla2xxx: Removed extra space in variable
 declaration.
From:   "Milan P. Gandhi" <mgandhi@redhat.com>
To:     kernel-janitors@vger.kernel.org
Cc:     GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org,
        njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com
References: <20210211093552.GA5375@machine1>
Organization: Red Hat
Message-ID: <6266f3b1-1890-d69b-eeed-cb60ee8d02bb@redhat.com>
Date:   Thu, 11 Feb 2021 18:33:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20210211093552.GA5375@machine1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Apologies for missing a note about change. Will correct it now and send updated version.

On 2/11/21 3:05 PM, Milan P. Gandhi wrote:
> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
> ---
> diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
> index ab45ac1e5a72..7f2db8badb6d 100644
> --- a/drivers/scsi/qla2xxx/qla_attr.c
> +++ b/drivers/scsi/qla2xxx/qla_attr.c
> @@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
>  	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
>  	    struct device, kobj)));
>  	struct qla_hw_data *ha = vha->hw;
> -	uint16_t	cnt;
> +	uint16_t cnt;
>  
>  	if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
>  	    !ha->isp_ops->write_nvram)
> 

