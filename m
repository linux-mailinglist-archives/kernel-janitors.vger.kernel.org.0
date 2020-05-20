Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794291DBBEF
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 19:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgETRvz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 May 2020 13:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETRvy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 May 2020 13:51:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A231C061A0E
        for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2020 10:51:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w64so3802886wmg.4
        for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2020 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6/K2r2mMGNXC0hjZP/edQuVZv9WqLKDECwgj0t5H2CI=;
        b=IGPX9L4k9Ivw+STA53YDbcHe/jWijBpChsxcqfoVM4H3g1XLSmcioRjHcCKLrrVXn/
         IvwXg4tS7GDt1kk9mgVwwD9zNxTRVsi4QdEtLK9WkvVz3kiTGOpAkUs+thETBXohhIbT
         jW+Ce0eAKMXAgHEZGKFtO3eooAOAnY3uy70m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6/K2r2mMGNXC0hjZP/edQuVZv9WqLKDECwgj0t5H2CI=;
        b=Nzq6YQ/EANFyXLyRlUDuMJmJ8HSkZetq3qE4bsBhCJnkcMIMuzjJZbMzeySqbL++KC
         JDdfFDOa3y2fTdcNHOfG1m3eJUYx9Xa0OH0UhXN2hPFi7h5sZjQ97XPlJodVKTEGdR8a
         e+0QZzgy36eEivYSlaSpHiRUFp9nihRfiLX2zCK0gHx3I81cb9Z73HJDivME3rTQLk9i
         uAhwc7NlP6p96nBL6VnIs3LenN0zaavhJjXfYeZnpCnCw7OICTPXzLSkguKO3Xnlq8jY
         HSD6N/2s1xQgAurvDVHFbH9X+XYRoWcqeUtVmAaeoShE1iJLz/Bl4/YhmnIWk8HQmjhx
         I5Yg==
X-Gm-Message-State: AOAM532tqIGEKeSXD9cByoYbTXCELBm4gIUJ3IcSy4wNSOdojrXt2WVI
        jtSWY8fr+El0f+RFS+MJJXQY2Q==
X-Google-Smtp-Source: ABdhPJwUu6hTVJnqQMkiiZojWCHHXZqLpYI4Ef1FWPqKJaOiKZnv/kYPTv56XL9GKNQQAczOtcdHlg==
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr5386234wml.75.1589997113302;
        Wed, 20 May 2020 10:51:53 -0700 (PDT)
Received: from [192.168.1.237] (ip68-5-85-189.oc.oc.cox.net. [68.5.85.189])
        by smtp.gmail.com with ESMTPSA id q9sm3646293wmb.34.2020.05.20.10.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 10:51:52 -0700 (PDT)
Subject: Re: [PATCH resend] scsi: lpfc: Fix a use after free in
 lpfc_nvme_unsol_ls_handler()
To:     Christoph Hellwig <hch@infradead.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org,
        Paul Ely <paul.ely@broadcom.com>,
        Hannes Reinecke <hare@suse.de>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <yq1y2purqt1.fsf@oracle.com> <20200515101903.GJ3041@kadam>
 <20200520165557.GA9700@infradead.org> <20200520172433.GD30374@kadam>
 <20200520172844.GA21006@infradead.org> <yq1y2pmtsv7.fsf@ca-mkp.ca.oracle.com>
 <20200520173752.GA13546@infradead.org> <yq1sgfutsjd.fsf@ca-mkp.ca.oracle.com>
 <20200520174800.GA13253@infradead.org>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <4693662b-60de-388e-d67f-722eabbba475@broadcom.com>
Date:   Wed, 20 May 2020 10:51:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520174800.GA13253@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/20/2020 10:48 AM, Christoph Hellwig wrote:
> On Wed, May 20, 2020 at 01:39:55PM -0400, Martin K. Petersen wrote:
>> Christoph,
>>
>>> I'll pick it up.  Can you give me an ACK for it to show Jens you are
>>> ok with that?
>> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> Thanks,
>
> applied to nvme-5.8.

Guess you didn't see Dan's response - we had replied, and Dick rejected 
it. Dick has created a new patch that I'll be posting shortly.

-- james


