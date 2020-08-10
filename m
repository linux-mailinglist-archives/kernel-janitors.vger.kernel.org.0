Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4192407AD
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Aug 2020 16:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHJOfv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Aug 2020 10:35:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28303 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726111AbgHJOfu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Aug 2020 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597070149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dXWSa0571ciFu2t/WYhoCRkUSyhVOHJkVHffG1Nnkws=;
        b=BWG7rS0MuDhyGPjEW5MSjJwUO3NMioZpzVGf3ITGqA2ud70ODIkZsCsXhUe+oZrF3dli+W
        reOff/7HPsGiebHv+5x1++/IgBllP1d8jCB0/nZObnvzRdOEQgX8Cayb8a30Fq2xMlcfow
        2gPKahcDATsGNtu1x4CbuYTdGrstGlg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-3XcyxwCDN7GFw8aW3MDKbg-1; Mon, 10 Aug 2020 10:35:45 -0400
X-MC-Unique: 3XcyxwCDN7GFw8aW3MDKbg-1
Received: by mail-wr1-f71.google.com with SMTP id t3so4298376wrr.5
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2020 07:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dXWSa0571ciFu2t/WYhoCRkUSyhVOHJkVHffG1Nnkws=;
        b=P3HU4HoxaIb4PRK3czl/Ca8MJVDO0iJXRurbBDywnFMEsPQyyM4wnMRDADmYgTR1Jx
         LfEr5b5SOgvhePzIAfkLZbxTQ86IvogiKe4/GfVTkfaROJP1X5GeGXoCRlziVp3a3HuH
         tcgSk92jA/Afv09U/GhAVf9FoHtyZoxX5pwodyWazyaocR1pHgazgH/VEGXjHQEYIS0X
         zHdFZDI+p4E2lTEzxlYsCuK83EIytTEN0CkW8DJZIu7CdNX9zAPJKmzkF0EpMXfHBDVI
         AySmc+alxU7t4PUnDyqmtGXaAwy+0I9RUfjHk/hGlGL0UxZqRZlKZ8YQt306+RAY6AUp
         75Ug==
X-Gm-Message-State: AOAM531wBf0Y5GOO7h+/PfK87A1IcjUMfiUBb6f+0eAAXF0zyaSqTuGW
        fkU+pun37Uy4rBZz2tTPBpy2ef7Sb/mN1YimgJC/gmzrcwKXvh4S6Fjl/jyPtemEZoKzDME9EOs
        HXOPQB9lQqyuH77ksWuLN+bt4AJJO
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr23385144wrp.44.1597070143564;
        Mon, 10 Aug 2020 07:35:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsJrwNV1lKdihec0GG/tFTx2Ql3DBf0DtDHWJt9b3Ujf/23hQsf72YgGEndpIM647ySIAQDw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr23385131wrp.44.1597070143428;
        Mon, 10 Aug 2020 07:35:43 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id k10sm20742786wrm.74.2020.08.10.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 07:35:42 -0700 (PDT)
Date:   Mon, 10 Aug 2020 10:35:39 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eli Cohen <elic@nvidia.com>, Eli Cohen <eli@mellanox.com>,
        Jason Wang <jasowang@redhat.com>,
        Parav Pandit <parav@mellanox.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] vdpa/mlx5: Fix pointer math in mlx5_vdpa_get_config()
Message-ID: <20200810103522-mutt-send-email-mst@kernel.org>
References: <20200808093241.GB115053@mwanda>
 <BN8PR12MB3425E1FCC3E20A04182640D2AB470@BN8PR12MB3425.namprd12.prod.outlook.com>
 <20200810103147.GJ1793@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810103147.GJ1793@kadam>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 10, 2020 at 01:31:47PM +0300, Dan Carpenter wrote:
> On Sun, Aug 09, 2020 at 06:34:04AM +0000, Eli Cohen wrote:
> > Acked-by: Eli Cohen <elic@nvidia.com>
> > 
> > BTW, vdpa_sim has the same bug.
> > 
> 
> I sent a patch for that on April 6.
> 
> [PATCH 2/2] vdpa: Fix pointer math bug in vdpasim_get_config()
> 
> Jason acked the patch but it wasn't applied.
> 
> regards,
> dan carpenter

Oh sorry. I'll drop my patch and queue yours then.

