Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6420321A258
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jul 2020 16:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGIOnX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jul 2020 10:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgGIOnX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jul 2020 10:43:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07754C08C5CE
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Jul 2020 07:43:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w3so2091657wmi.4
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Jul 2020 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6KoAFUsUrZ7flV3NXYhvK8N5k4F/lRegtCNv8DS45bg=;
        b=LUNGXiDbl9DtqNPaT0f+H1y3L1yDl4rS2y10Dzyjb8SoAMWd2asubpPUen66Ck2nJK
         /991ZvY0dwfsdsbdgys/rxK54Xd036ElXK4ihRhe5/89CryfYkLHBrqrsunggcvRltx4
         JByvg6VrJV32KsLeyyJ7OZvMLosm3ny0gHMPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6KoAFUsUrZ7flV3NXYhvK8N5k4F/lRegtCNv8DS45bg=;
        b=F6XkmLCFrp+YmhpURX3D1WeL9LSkFecSfne9lhnAXPAc5WhpUB7dkIc5IV1AGque8h
         J2p3R7UVnyPOsZi7A3+qj/8OVb+T6i2A3yW0z4UpNXCxMPx4IaHcsqPhL/hASvHsc5m3
         XpHlTes8qWI139UBCmitadcbV8Bo6zvDHPys5qmSNVr7lo7nFbA9zN84uNGvhSIABvem
         WM02xCBXIE4dMak3p2F+q0RSkGtMj0JtoLXPsaejmFhuO7D0RJWuTS3fwATGW66EC0xI
         nAube7OthTUpp8RuCGXl5+jgJf7iurr2lenIOU9s43nU7ADNxcCHlvZVKtbZgWt79R6P
         iAKQ==
X-Gm-Message-State: AOAM530QmzR1JrP+yLi4i6u1eJhFp2dghRMp/N1gXk5gsc88wwbyHLpE
        3u2nkkQYQ9Yq/pCt+NLDiqmIdH4CafhB873X4fD3KuBKb/i/23s0JE5hsAekHPhOSdkLRp/LTHR
        +iVgjzp1UXXQFOS8sGjFr0v831PwVsGY9GTR4ivYFc3wyATpn622Ha6O3hZwN5Ivj4F9tt/n0n5
        RwKcFgpAo=
X-Google-Smtp-Source: ABdhPJxaudZr04lUjxPGVUndU4tGUVgotYNJeA9ASesDFcG2ySk1xc9QRQlgAlKkgaE0phMmj5sGcg==
X-Received: by 2002:a05:600c:414f:: with SMTP id h15mr423555wmm.82.1594305801080;
        Thu, 09 Jul 2020 07:43:21 -0700 (PDT)
Received: from [192.168.1.237] (ip68-5-85-189.oc.oc.cox.net. [68.5.85.189])
        by smtp.gmail.com with ESMTPSA id g14sm5859528wrm.93.2020.07.09.07.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 07:43:20 -0700 (PDT)
Subject: Re: [PATCH v2] scsi: lpfc: Fix a condition in lpfc_dmp_dbg()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>
Cc:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200709105826.GH2571@kadam>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <3c46ca75-54d7-7f75-edfb-514b34b003dc@broadcom.com>
Date:   Thu, 9 Jul 2020 07:43:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709105826.GH2571@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/9/2020 3:58 AM, Dan Carpenter wrote:
> These variables are unsigned so the result of the subtraction is also
> unsigned and thus can't be negative.  Change it to a comparison and
> remove the subtraction.
>
> Fixes: 372c187b8a70 ("scsi: lpfc: Add an internal trace log buffer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  I reverse the if statement in v1
>
>   drivers/scsi/lpfc/lpfc_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 7285b0114837..2bb2c96e7784 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -14152,7 +14152,7 @@ void lpfc_dmp_dbg(struct lpfc_hba *phba)
>   		if ((start_idx + dbg_cnt) > (DBG_LOG_SZ - 1)) {
>   			temp_idx = (start_idx + dbg_cnt) % DBG_LOG_SZ;
>   		} else {
> -			if ((start_idx - dbg_cnt) < 0) {
> +			if (start_idx < dbg_cnt) {
>   				start_idx = DBG_LOG_SZ - (dbg_cnt - start_idx);
>   				temp_idx = 0;
>   			} else {

Already resolved/accepted.

https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=77dd7d7b3442

Thank you though.

-- james

