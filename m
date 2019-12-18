Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C566F1252F6
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Dec 2019 21:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfLRUPL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Dec 2019 15:15:11 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35063 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfLRUPL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Dec 2019 15:15:11 -0500
Received: by mail-pf1-f194.google.com with SMTP id b19so1838256pfo.2
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Dec 2019 12:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HD8W6fhAu1mWofyKWkCz1NpTzUclxFawWOIeyvyb7f4=;
        b=C9ULTBWptCUWmD4A0U4YXZGV1wIL4RakCm6UgvCU+1w9CnLOe7Lh/A2xOupd1x7WQP
         AfJnFEHSbOWYZvI9lI5Qexm+/4aQ0XSkPvGrCt4bOdMizuVDYoWv6ewj7gKCj1JFFzAI
         bnG4m9338dqqU5AwfTg6O+FNFnZxpHYDTNSVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HD8W6fhAu1mWofyKWkCz1NpTzUclxFawWOIeyvyb7f4=;
        b=oZQZAMXcr0tLPuwzGKTe1zCSItQ2KynUzEI0oGJc9sUn503Y6RjMznEUTPnZz8bnTQ
         iJwpc5YHkGKusMZscD9+HFTq6DnryRSjiKQBRDQlh9I6B++l/zCx3bOSS/hUi0TY+lh5
         8pikeX8qmFR5H9HWRAv4y1kg9lmmUeo2VsqGUUz4ZF7ehnXpMn2ximnNbzqRptHJw8PL
         zAVf86sjwqIJ+KOmCGHxLvQS16V4ZZbyTQqTGSzYOtJyzsp5cs3Rl0qh5ElMnQPKEnFj
         79QaQnCVJtl0DlSXz/IVWYeoYa1TIxuhpByTvEoo7a0Ekqwlt/HCTIx2625ZMHdZr7r3
         spaA==
X-Gm-Message-State: APjAAAWc1BXRuRu2/hy55zRHmuX0y3g6UsKlRuQ23eYnWF+HIqu3oXBZ
        LXIQgsVWt/8x6LW/+GO7kIACIA==
X-Google-Smtp-Source: APXvYqySjaIGnai4aQAxwyqY2JNgSL5HA+f/f2TVbZItNdpctnD8WhUrDSozrX1opco+RPLyQXOI7A==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr5167907pfn.245.1576700111152;
        Wed, 18 Dec 2019 12:15:11 -0800 (PST)
Received: from [10.230.29.90] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id i9sm4449775pfk.24.2019.12.18.12.15.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 12:15:10 -0800 (PST)
Subject: Re: [PATCH] scsi: lpfc: fix spelling mistakes of asynchronous
To:     Colin King <colin.king@canonical.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191218084301.627555-1-colin.king@canonical.com>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <79579d2d-ea32-e529-6cf4-7a02ff955cfb@broadcom.com>
Date:   Wed, 18 Dec 2019 12:15:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218084301.627555-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 12/18/2019 12:43 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are spelling mistakes of asynchronous in a lpfc_printf_log
> message and comments. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/scsi/lpfc/lpfc_init.c |  2 +-
>   drivers/scsi/lpfc/lpfc_sli.c  | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
>

Looks good. Thanks Colin.

Reviewed-by: James Smart <james.smart@broadcom.com>

-- james

