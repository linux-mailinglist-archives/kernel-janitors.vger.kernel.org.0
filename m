Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71A2159DC
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Jul 2020 16:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgGFOsW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Jul 2020 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729250AbgGFOsW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Jul 2020 10:48:22 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED70EC061755
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Jul 2020 07:48:21 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so38853102wrp.10
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Jul 2020 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cBZ2scPa5H+r50RUQxyW3XJ5xsh/nqsYrlxmo7w/e8w=;
        b=JrCEisNAfZ3q+hI01mukf0VgotpSmwx/3EA0lVL93a9mhJjLYMKTr+edgUYovIQUWC
         SOY7omUcDRq5G+Xjm8XrP5dCgnVehYA1I4Buebae7Mn7NzmVwqZI0UKX87V9dTORYxUB
         a9rlOdz8FbHuOYJutbG76thBXURF+ZbxXGeCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cBZ2scPa5H+r50RUQxyW3XJ5xsh/nqsYrlxmo7w/e8w=;
        b=pDY5bv3GhF3ib3OrteErcBhYiXdtDEmPvkFeQC1AqXimhE+jHL7S20VEd6ahKpVCni
         cmEL7xiq4CdasAWLBtietQ4bY35uwAwbCAh2QXv/Ov6/2r58BGus6JPbqMggIclMdwW+
         nX8gWB4lBUxZ1cl1/LegmuxUWbDnW8Ot3JNk69EVkFGx3DdmcjsWCEopHkojg7OgtiCM
         obULOkqVVY8XRXlJMBS+h6NfCjcQRMickbZg/GR84UcT2282bPeQCQtw0rzPfa6lgQ4R
         qcXcYN60fwvHKbXyzfvIaVsdVpEwXre8LWJvvQkvCUK6/OSjNcfNSyIoJzsijDlFR76Y
         EENw==
X-Gm-Message-State: AOAM532VrNrXj06WtxrTqjH5xhJ8jk9hcoN0OPKztZh/ZED2USZgiuCc
        AIFR+0B67Sz8lz4w/L2usteMcw==
X-Google-Smtp-Source: ABdhPJyDCzhSaOmHq049kLL6PXnNNhsPb7sswh46NV21Ro6z1vjnWiqyJZwkoucKnfUQ+ZjY+/JaTA==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr46581284wrw.28.1594046900665;
        Mon, 06 Jul 2020 07:48:20 -0700 (PDT)
Received: from [10.230.185.151] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c136sm19604644wmd.10.2020.07.06.07.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 07:48:20 -0700 (PDT)
Subject: Re: [PATCH][next] scsi: lpfc: fix less than zero comparison on
 unsigned int computation
To:     Colin King <colin.king@canonical.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200706130820.487271-1-colin.king@canonical.com>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <44692d32-d522-43ff-de74-a1faa432a911@broadcom.com>
Date:   Mon, 6 Jul 2020 07:48:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706130820.487271-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 7/6/2020 6:08 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The expressions start_idx - dbg_cnt is evaluated using unsigned int
> arthithmetic (since these variables are unsigned ints) and hence can
> never be less than zero, so the less than comparison is never true.
> Re-write the expression to check for start_idx being less than dbg_cnt.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 372c187b8a70 ("scsi: lpfc: Add an internal trace log buffer")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/scsi/lpfc/lpfc_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 7285b0114837..ce5afe7b11d0 100644
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

Thanks Colin - I was about to send a patch for this. Has this fix and 
one a couple of lines further down. I will post it shortly.

-- james

