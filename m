Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02EF132202
	for <lists+kernel-janitors@lfdr.de>; Tue,  7 Jan 2020 10:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgAGJO5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Jan 2020 04:14:57 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35676 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727589AbgAGJO5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jan 2020 04:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578388496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QrOfLC4L42KHgQ57s05Fzzw7KEtckHfa0upM6Qa2qkU=;
        b=gWxVd634xvVM1vb+uREyNagK4KB4rypMsONbESqbgFqoU4N7uMcDj+GfbG4xb39YSEf053
        6dy11yLxlBigwhV/WeRYLTdi9GCxgegJBweB1Gf/5/fmBWSjbEwB4v/4TXYyLSndsuVU7A
        eaGEOKP8s0EFIZwloj+UtqCSJxZqXgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-uu_9g6DMP7WzveXObbLVcw-1; Tue, 07 Jan 2020 04:14:53 -0500
X-MC-Unique: uu_9g6DMP7WzveXObbLVcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF97107ACE6;
        Tue,  7 Jan 2020 09:14:52 +0000 (UTC)
Received: from gondolin (ovpn-117-222.ams2.redhat.com [10.36.117.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7358586C41;
        Tue,  7 Jan 2020 09:14:48 +0000 (UTC)
Date:   Tue, 7 Jan 2020 10:14:45 +0100
From:   Cornelia Huck <cohuck@redhat.com>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] vfio/spapr_tce: use mmgrab
Message-ID: <20200107101445.7f3f1480.cohuck@redhat.com>
In-Reply-To: <1577634178-22530-4-git-send-email-Julia.Lawall@inria.fr>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
        <1577634178-22530-4-git-send-email-Julia.Lawall@inria.fr>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 29 Dec 2019 16:42:57 +0100
Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> helper") and most of the kernel was updated to use it. Update a
> remaining file.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ expression e; @@
> - atomic_inc(&e->mm_count);
> + mmgrab(e);
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/vfio/vfio_iommu_spapr_tce.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

