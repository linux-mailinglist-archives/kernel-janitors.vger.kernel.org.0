Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E6F3B0D52
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Jun 2021 20:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhFVTAo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Jun 2021 15:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbhFVTAm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 15:00:42 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11864C061756
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 11:58:26 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id g12so249412qtb.2
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 11:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UdWZ0CHLUB7bOo2i3yWFTqQUGrVEh4Ns+KUFKJojrnA=;
        b=W7CMRhD5cFhqE8QbCOB7mJJ3cO41azUCRjnmOicgTvHb/6AfkbDrBkvm5URbIuNCT6
         +WGeG9m/ua/XrfNu51VaMoPqcP1Qz4FiyhbxlsaBViWKvlFo0/6E9LJ5SPw9RrHHSNNp
         wXwLy1LarPFhFor1zssBDwfcwjyrMh6ydltVaao46d3Ll+nUSr8X97VxjpHslaQ2Zxdm
         Ux1Oicj2ktJjC2bKYIxxXlTfBQyRP9WTIltX/V+f72gcykvVdgct/8/uRW5g4LykFio0
         VhLEXdfxtQiABckJoy4D0nbubtCLsoCGVKtghnZn4Ymrr0EWk7xRfDoI6kknrPppck62
         MPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UdWZ0CHLUB7bOo2i3yWFTqQUGrVEh4Ns+KUFKJojrnA=;
        b=pEvRgdGOCdY1GMQkBnsGicLze6acPUPgcSvzCtJuE1OXUAJ76xU05LT8nGlXtSlN0I
         yPeWF9PcK9bVO73nOtiqsRf+kAMYsclISjUoyy15dYJo1NHs5wTN744nP5jMxHsQmRl4
         lcjn5Jh2820kNRCEysb99qaMDNyIR4wDY/Ye6B7Kq44uIceMDFIXuLJckdzJEi7U57Io
         gH7ZDp1Aq4cb+lDB3QjInY2LKb/BNqEV6jGWhEjvEyy0LrmSeasQhSuS9oAgXEtQLLsb
         53RCZSFlQpFu4T3h+Tqx0Ib1f3WK5t3g2hzpfGS+40szF+apGNpS5Y6Y1phCcJosJ17v
         ajDQ==
X-Gm-Message-State: AOAM531T1uuGSNLZcWR7QZynA4XV+eQUX4SOFHGwxX4lo0D5Ef58ucRM
        RzSIJl8ocrTclWOFYPR/HjcLsg==
X-Google-Smtp-Source: ABdhPJxXd9xJsFlP192LrX6fgCgr9mM0qz/xNLP+ejHO0m4w2TuAR83FKQnxq8xlRwlu9oz0BD6IQw==
X-Received: by 2002:ac8:480c:: with SMTP id g12mr234493qtq.320.1624388305168;
        Tue, 22 Jun 2021 11:58:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id m3sm11015240qkk.27.2021.06.22.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:58:24 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lvlbM-00Az4q-2v; Tue, 22 Jun 2021 15:58:24 -0300
Date:   Tue, 22 Jun 2021 15:58:24 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     Kirti Wankhede <kwankhede@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vfio/mdpy: Fix memory leak of object
 mdev_state->vconfig
Message-ID: <20210622185824.GU1096940@ziepe.ca>
References: <20210622183710.28954-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622183710.28954-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 22, 2021 at 07:37:10PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where the call to vfio_register_group_dev fails the error
> return path kfree's mdev_state but not mdev_state->vconfig. Fix this
> by kfree'ing mdev_state->vconfig before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>  samples/vfio-mdev/mdpy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index 7e9c9df0f05b..393c9df6f6a0 100644
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -261,6 +261,7 @@ static int mdpy_probe(struct mdev_device *mdev)
>  
>  	ret = vfio_register_group_dev(&mdev_state->vdev);
>  	if (ret) {
> +		kfree(mdev_state->vconfig);
>  		kfree(mdev_state);
>  		return ret;
>  	}

Thanks Colin, looks right

Alex, this is in your hch-mdev-direct-v4 branch can you squash or
whatever?

Though if we are touching this I prefer the below:

diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 7e9c9df0f05bac..868a0e7fa90e98 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -235,17 +235,16 @@ static int mdpy_probe(struct mdev_device *mdev)
 
 	mdev_state->vconfig = kzalloc(MDPY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 	if (mdev_state->vconfig == NULL) {
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_state;
 	}
 
 	fbsize = roundup_pow_of_two(type->width * type->height * type->bytepp);
 
 	mdev_state->memblk = vmalloc_user(fbsize);
 	if (!mdev_state->memblk) {
-		kfree(mdev_state->vconfig);
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_vconfig;
 	}
 	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
 		 type->height);
@@ -260,12 +259,17 @@ static int mdpy_probe(struct mdev_device *mdev)
 	mdpy_count++;
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
-	if (ret) {
-		kfree(mdev_state);
-		return ret;
-	}
+	if (ret)
+		goto err_vconfig;
+
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
+
+err_vconfig:
+	kfree(mdev_state->vconfig);
+err_state:
+	kfree(mdev_state);
+	return ret;
 }
 
 static void mdpy_remove(struct mdev_device *mdev)
