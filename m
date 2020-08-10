Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6186B240633
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Aug 2020 14:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgHJMvY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Aug 2020 08:51:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30888 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726707AbgHJMvW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Aug 2020 08:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597063881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WbCRipNDdE2rdGG8Ew5oYAs5hi/QBu0fk1zdZZ69+Ag=;
        b=Jp2Cfw0zfjpG0fmiiScJfPPFtBAM9L1uaBn8bO+zSVZUKFFJN2oZKOpcNOrXYp0r6s+o2H
        eIRw1Uob8hSaUVsykwULMK37xKOIJDhm3a95KKOh2ZZtFlEHxGCRsgLNl0ph0j9Q3awmn/
        mMz3cpRvUxp4vIA4lX9azXA1lxxpApo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-_xoNxSfcMUGMPCy0N9n_dw-1; Mon, 10 Aug 2020 08:51:19 -0400
X-MC-Unique: _xoNxSfcMUGMPCy0N9n_dw-1
Received: by mail-wm1-f70.google.com with SMTP id q15so2833168wmj.6
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2020 05:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WbCRipNDdE2rdGG8Ew5oYAs5hi/QBu0fk1zdZZ69+Ag=;
        b=r/4qZSyKj8LU1JUVrJDz+0P18M3k4zznbm5nVZg5y9EyN5omtuyLGegGCPKgXbOMpO
         8oFSurc6ev4Ql89UvmmyLLuW8W4EGtdUX6TNR0Z/dN5iChLSVm41e0fMHdbSwHA7UUl9
         mZCH3I6PbvRQ0TbIrymhjD1hcUUqMYqx9qJi3Rb/0Cml+kohvB7WKoNxO31dxDdrTVI7
         KiOgt3hu5KqDdF5zE2O9Cl8JHd0ivirMuD5204vBK0yjxJ3LjgW3R/85d0HNXBa+wo8V
         mhF3mGBVSA/7J8O398IwTmzfOerI9XCijup/mU+TcIgIDltDXFTcXbNRigWgO6SbdFn6
         sM1g==
X-Gm-Message-State: AOAM5304/CL3Qan4M4J2w/QDon+remPCPD2fjOKf4uj/zS137T2qsYFJ
        AvH0Alse6Rju3jHGxJN0zZLVMNuquYuDfFrQHRrVtpEVfAXg9PDk7GCUEs/P0ixiFfjIHEEBaWM
        fn6uPSr7aZ5Au6uy6M4DaOTJ/31wd
X-Received: by 2002:a1c:660a:: with SMTP id a10mr23997548wmc.115.1597063878271;
        Mon, 10 Aug 2020 05:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzy3Dz3dF5JO2RN9WQmfJMP4NbRyiuZeMh6LVQ+I1mdOBPFJ/QmTu8RxjAG9ENsA2zx2Z1Uw==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr23997530wmc.115.1597063878140;
        Mon, 10 Aug 2020 05:51:18 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
        by smtp.gmail.com with ESMTPSA id g145sm29537435wmg.23.2020.08.10.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 05:51:17 -0700 (PDT)
Date:   Mon, 10 Aug 2020 08:51:14 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Eli Cohen <eli@mellanox.com>
Cc:     Colin King <colin.king@canonical.com>,
        Jason Wang <jasowang@redhat.com>,
        Parav Pandit <parav@mellanox.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vdpa/mlx5: fix memory allocation failure checks
Message-ID: <20200810085100-mutt-send-email-mst@kernel.org>
References: <20200806160828.90463-1-colin.king@canonical.com>
 <20200809060347.GA48369@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809060347.GA48369@mtl-vdi-166.wap.labs.mlnx>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Aug 09, 2020 at 09:03:47AM +0300, Eli Cohen wrote:
> On Thu, Aug 06, 2020 at 05:08:28PM +0100, Colin King wrote:
> Acked by: Eli Cohen <eli@mellanox.com>

That should be Acked-by: (with a dash).

