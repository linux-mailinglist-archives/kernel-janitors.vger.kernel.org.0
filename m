Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61AC439A8
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732614AbfFMPPP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:15:15 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:33510 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732228AbfFMNZ4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 09:25:56 -0400
Received: by mail-yw1-f66.google.com with SMTP id n21so2248610ywh.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L8n107KncEadiGucDyUOK1dc7Qoutbu/OkCN1q9wnKQ=;
        b=T75PJq2EBg1P6e56UgbjWnrSLbUMr0q8C7tRRjRh+94AczGGES6QfzrFVyga6yTDBL
         eNyYFSXWvc5xDFkJFr5m8mdG1nzNUtd8pP3i+4MqWQ8Cvd2Im8TQ6PEaJCbB/JSwhs/6
         k2VU1dNUPbwmH9fWul1KXxCVJDMoyy77xxEmfvmhJwH4HYQp9HQZAHQEPort5tewGCnS
         PGzGhgm3xPlR/BNhfJ56el+G+yF9BT5XtqYYQayL9ExP+RBlI2mZ7fFs2RQ1PG+nIM3G
         mRtZ4RtsJHSBREICIIWJ3Bnc4eX7R3pGkNHyr/he0XPq7QuaVIe54tbPvyeSVzhbbuxU
         rYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L8n107KncEadiGucDyUOK1dc7Qoutbu/OkCN1q9wnKQ=;
        b=asNZMN/RRH5IX13U6lrMGJi8jV+Caq3UsbuHf/aE6yE7SfHrrd+YmECXOvWWqDtceC
         lnOP32M9a/tIgSF/bVJWwa8JhQqANry+uy+Tg7l/OTDcuA3Cm42iH/CKlGvn5Zz83nCX
         6mH71KQI7vBpQVmH2JPQQr2bOUr57Kw/jHRtk6+31Ur+bwDITut/y6YQ62uHlt1mrJq0
         tvqMtSAQbigbqu9FoUteERGUJ0mKTwi6PuyKx1a3WvIlwphWlzGDJXDt4FLuOv21a0Rk
         lzsy7D4IInQCPSZxfGY3SwzCxSVancJHzEWQni05NhDMvjasKAD6KTjhEIUYbJ4fF69M
         hG5w==
X-Gm-Message-State: APjAAAVBHpgVs/PvYsY1zYlA1EfJVOJwPKRfJazSpu7GvDvAI3CcDZun
        lebPdTEs55vGLVBuz+90y5slXg==
X-Google-Smtp-Source: APXvYqxjNGc6AcyEwZ/t/zcIOEouNn4QjUQcqZAqhno7R1RgUL6b0qSoKcPTm1rLqUfvQtW5ZcYsdg==
X-Received: by 2002:a81:2f4a:: with SMTP id v71mr46927896ywv.51.1560432355472;
        Thu, 13 Jun 2019 06:25:55 -0700 (PDT)
Received: from kudzu.us (76-230-155-4.lightspeed.rlghnc.sbcglobal.net. [76.230.155.4])
        by smtp.gmail.com with ESMTPSA id p12sm740145ywg.72.2019.06.13.06.25.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 06:25:55 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:25:53 -0400
From:   Jon Mason <jdmason@kudzu.us>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Kelvin Cao <kelvin.cao@microsemi.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>, linux-pci@vger.kernel.org,
        linux-ntb@googlegroups.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ntb_hw_switchtec: potential shift wrapping bug in
 switchtec_ntb_init_sndev()
Message-ID: <20190613132553.GC1572@kudzu.us>
References: <20190325091726.GD16023@kadam>
 <e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef@deltatee.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 25, 2019 at 09:49:31AM -0600, Logan Gunthorpe wrote:
> Thanks!
> 
> On 2019-03-25 3:17 a.m., Dan Carpenter wrote:
> > This code triggers a Smatch warning:
> > 
> >     drivers/ntb/hw/mscc/ntb_hw_switchtec.c:884 switchtec_ntb_init_sndev()
> >     warn: should '(1 << sndev->peer_partition)' be a 64 bit type?
> > 
> > The "part_map" and "tpart_vec" variables are u64 type so this seems like
> > a valid warning.
> > 
> > Fixes: 3df54c870f52 ("ntb_hw_switchtec: Allow using Switchtec NTB in multi-partition setups")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Sorry for the delay.  The patch is now in the ntb branch.  We've
missed window for 5.2, but it will be in the 5.3 pull request.

Thanks,
Jon

> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-ntb" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-ntb+unsubscribe@googlegroups.com.
> To post to this group, send email to linux-ntb@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/linux-ntb/e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef%40deltatee.com.
> For more options, visit https://groups.google.com/d/optout.
