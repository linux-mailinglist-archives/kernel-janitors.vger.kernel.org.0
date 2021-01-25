Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF54F304811
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Jan 2021 20:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbhAZFwH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Jan 2021 00:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34064 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727315AbhAYKXh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Jan 2021 05:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611570102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=neC9gRrB4GfD4ikmR6bOJWjEMRDiBCVqaviG/V2Kj6M=;
        b=bzyyobXeLlbDDcoXFCfNB/hDbPLn8MYVluNY7gmmbzyU6XSmiBM7eXb0DendK0BxXJ6lSm
        rnPwinzwdSLCXr4sPU5ltXvbhz0Aunzvy3UfB1oL760/hQsv6ZXSq7u0A4Z0+0OwjLEXgl
        H0JdYmNFgvSHukLI3zeo92D55P9ZF9A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-9MWVKo4iM3KI4M0D_kxdMA-1; Mon, 25 Jan 2021 05:21:40 -0500
X-MC-Unique: 9MWVKo4iM3KI4M0D_kxdMA-1
Received: by mail-wr1-f69.google.com with SMTP id l7so1513199wrp.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Jan 2021 02:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=neC9gRrB4GfD4ikmR6bOJWjEMRDiBCVqaviG/V2Kj6M=;
        b=qmQHjxJuMpYww4YORpV4DPUAT8s2w1d04x0zcBr8ICZNUAPVt/lb4P9IxGQa5LSdxr
         5d4K8iOnv+KfAiyvta0QcB2HzGLUrt8AlF3wFYL2MCcqZ/hjTu0mtHHFDsQxQ5G2hBl/
         COCQ/RCLg2e+KuKpiQC0Nn3lqJJBhRliqmsr1kGbjtm+UiUDMO3uhMCGfER8uMoaagFd
         BGPT5KizzWD7ahKb59ubYbXgsQpG7ItqiJa3i92HnVKwHM85aYYEWks+EYH5/WGhIvVl
         eM+UCmiiIhbE2SylqXMbsPMf/bt5fY1ZqR3ZdHckuWGiEK14JyDKIonqfNUdGBzJCgtM
         162g==
X-Gm-Message-State: AOAM531lh5ivLk+5W+KpLk73ZlVllvkIG0Tv8j+VfF8dFILDtRsAt8Yd
        FRjkC3j6z4cS+yLZxlVWhdOjVoXPbG4+RmRu7ob/aaIOH+b6ID2r4nW6ARVSjqaQ/GEFb/QwmCa
        8HvHhSq0tEZzEBHuO2zmtYb0TjgOs
X-Received: by 2002:a05:6000:108b:: with SMTP id y11mr47290wrw.379.1611570099631;
        Mon, 25 Jan 2021 02:21:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo8xB0nNvfVQNlZFuiUUrKX4YBDOVPnzKGovmFB65m63nYV0NQGp/FRjcrGa9UOHgLHWoAig==
X-Received: by 2002:a05:6000:108b:: with SMTP id y11mr47272wrw.379.1611570099455;
        Mon, 25 Jan 2021 02:21:39 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it. [79.34.249.199])
        by smtp.gmail.com with ESMTPSA id z130sm20270523wmb.33.2021.01.25.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 02:21:38 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:21:36 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Parav Pandit <parav@nvidia.com>, Eli Cohen <elic@nvidia.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vpda: Fix memory leaks of msg on error return paths
Message-ID: <20210125102136.6e7dye5ucoe5qiw2@steredhat>
References: <20210122145235.209121-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210122145235.209121-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jan 22, 2021 at 02:52:35PM +0000, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>There are two error return paths that neglect to free the allocated
>object msg that lead to memory leaks. Fix this by adding an error
>exit path that frees msg.
>
>Addresses-Coverity: ("Resource leak")
>Fixes: 39502d042a70 ("vdpa: Enable user to query vdpa device info")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> drivers/vdpa/vdpa.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
>index 9700a0adcca0..eb1f5a514103 100644
>--- a/drivers/vdpa/vdpa.c
>+++ b/drivers/vdpa/vdpa.c
>@@ -540,13 +540,15 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
> 	if (!dev) {
> 		mutex_unlock(&vdpa_dev_mutex);
> 		NL_SET_ERR_MSG_MOD(info->extack, "device not found");
>-		return -ENODEV;
>+		err = -ENODEV;
>+		goto err;
> 	}
> 	vdev = container_of(dev, struct vdpa_device, dev);
> 	if (!vdev->mdev) {
> 		mutex_unlock(&vdpa_dev_mutex);
> 		put_device(dev);
>-		return -EINVAL;
>+		err = -EINVAL;
>+		goto err;
> 	}
> 	err = vdpa_dev_fill(vdev, msg, info->snd_portid, info->snd_seq, 0, info->extack);
> 	if (!err)
>@@ -554,6 +556,7 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
> 	put_device(dev);
> 	mutex_unlock(&vdpa_dev_mutex);
>
>+err:
> 	if (err)
> 		nlmsg_free(msg);
> 	return err;

The patch looks okay, but reviewing it I figure out that if 
genlmsg_reply() returns an error, it also frees the sk_buff passed, so 
IIUC calling nlmsg_free() when genlmsg_reply() fails should cause a 
double free.

Maybe we should do something like this (not tested):

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 9700a0adcca0..920afcb4aa75 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -538,24 +538,29 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
         mutex_lock(&vdpa_dev_mutex);
         dev = bus_find_device(&vdpa_bus, NULL, devname, vdpa_name_match);
         if (!dev) {
-               mutex_unlock(&vdpa_dev_mutex);
                 NL_SET_ERR_MSG_MOD(info->extack, "device not found");
-               return -ENODEV;
+               err= -ENODEV;
+               goto err_msg;
         }
         vdev = container_of(dev, struct vdpa_device, dev);
         if (!vdev->mdev) {
-               mutex_unlock(&vdpa_dev_mutex);
-               put_device(dev);
-               return -EINVAL;
+               err = -EINVAL;
+               goto err_dev;
         }
         err = vdpa_dev_fill(vdev, msg, info->snd_portid, info->snd_seq, 0, info->extack);
-       if (!err)
-               err = genlmsg_reply(msg, info);
+       if (err)
+               goto err_dev;
+
         put_device(dev);
         mutex_unlock(&vdpa_dev_mutex);
  
-       if (err)
-               nlmsg_free(msg);
+       return genlmsg_reply(msg, info);
+
+err_dev:
+       put_device(dev);
+err_msg:
+       mutex_unlock(&vdpa_dev_mutex);
+       nlmsg_free(msg);
         return err;
  }
  

Thanks,
Stefano

