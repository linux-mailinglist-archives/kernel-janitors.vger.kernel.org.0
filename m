Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096D31D3741
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 May 2020 19:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgENRDr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 14 May 2020 13:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENRDq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 May 2020 13:03:46 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC32C061A0C
        for <kernel-janitors@vger.kernel.org>; Thu, 14 May 2020 10:03:46 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l18so5213372wrn.6
        for <kernel-janitors@vger.kernel.org>; Thu, 14 May 2020 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=md6Q3mRbTQ1WmLDfzP4CL8pYGQVjx67A8SJwik18qaQ=;
        b=Qp/j+VhkQBLwdy6pZLOdjD1KkK4SB6fdULcil1Bb/ApzRWGdZFxAc9p7F6UbNIQKCI
         CyZb//esyNNS8dxg9kMCgpNGmvdUrjXk0nPRN/j9JMX8vlYLYIb6TdNc+L2HnSLasb2C
         2wckG7U/dN5L6jeYO7chclIEByFxQfyw/dd/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=md6Q3mRbTQ1WmLDfzP4CL8pYGQVjx67A8SJwik18qaQ=;
        b=gBR8way5CcZfjdR1VG27nbatk0DaUF9Fv3qhTf93IRSxSK/jrCQB/bDrc0POR9rh9j
         RNihVmyZOGUnr7iOO2RoLb5S3Gaypo9SzyBbp44atEy81T1eXFn6qZCfAacL4hMuo+cw
         Xcpy5Q7n+s+fRBAMFkbiPf72QmM+HL80W9Z4BhhtvWXY5n/wESLeG66sYDY8ayHkgCSh
         kYTNVjTZij5astuBoxx4WpVmkQqapHRhZu9H4gIRjahdRU7/z7rkMWVbDAR11iJesk8M
         2zAphVtCL6cfVPi5Qs+mzmxriF8AtIYYclDkF3I/I+IUr5hB5MlGxEZWBQ3H8phfD8Q5
         LUXg==
X-Gm-Message-State: AOAM5313SgY4IPMCgGhYVS6oTE8lAGq6ZIDGXiRbXZp69LnmkekRxB1q
        kzdIGXnutrELNvlw7JSll9DYdGFh87U5pmDQ7n3nijFdC1Kpkif4xzbVlSSG5CMy+s+0FzMtuJp
        zmvt3azjWKwk7r3V3NOMVbmtXBGa5gw7rVY0OWQWxFZps536c4lLwTm7/jNeVyLrrse19J5HLJ4
        eshTPkNds=
X-Google-Smtp-Source: ABdhPJy6ZDXeup/5XjzV2A/FK2RNwAx28chynbVnxv+3+oi/KkFUEHyq19N8uVacZ7JTDJdhCQWCMQ==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr6406995wru.407.1589475824199;
        Thu, 14 May 2020 10:03:44 -0700 (PDT)
Received: from [10.230.185.151] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id n7sm4786435wro.94.2020.05.14.10.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:03:42 -0700 (PDT)
Subject: Re: [PATCH] scsi: lpfc: Fix a use after free in
 lpfc_nvme_unsol_ls_handler()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Paul Ely <paul.ely@broadcom.com>, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200512181909.GA299091@mwanda>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <4c0aa874-35db-65b5-e541-d513e7906254@broadcom.com>
Date:   Thu, 14 May 2020 10:03:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512181909.GA299091@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 5/12/2020 11:19 AM, Dan Carpenter wrote:
> The "axchg" pointer is dereferenced when we call the
> lpfc_nvme_unsol_ls_issue_abort() function.  It can't be either freed or
> NULL.
>
> Fixes: 3a8070c567aa ("lpfc: Refactor NVME LS receive handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/scsi/lpfc/lpfc_sli.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
> index 38889cb6e1996..fcf51b4192d66 100644
> --- a/drivers/scsi/lpfc/lpfc_sli.c
> +++ b/drivers/scsi/lpfc/lpfc_sli.c
> @@ -2895,14 +2895,14 @@ lpfc_nvme_unsol_ls_handler(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
>   			(phba->nvmet_support) ? "T" : "I", ret);
>   
>   out_fail:
> -	kfree(axchg);
> -
>   	/* recycle receive buffer */
>   	lpfc_in_buf_free(phba, &nvmebuf->dbuf);
>   
>   	/* If start of new exchange, abort it */
> -	if (fctl & FC_FC_FIRST_SEQ && !(fctl & FC_FC_EX_CTX))
> +	if (axchg && (fctl & FC_FC_FIRST_SEQ) && !(fctl & FC_FC_EX_CTX))
>   		lpfc_nvme_unsol_ls_issue_abort(phba, axchg, sid, oxid);
> +
> +	kfree(axchg);
>   }
>   
>   /**

Reviewed-by: James Smart <james.smart@broadcom.com>

Thank You

-- james

