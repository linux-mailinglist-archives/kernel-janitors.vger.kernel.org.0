Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7049D35B3F9
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Apr 2021 14:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbhDKMDM (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 11 Apr 2021 08:03:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50325 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhDKMDM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Apr 2021 08:03:12 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Sun, 11 Apr 2021 08:03:11 EDT
Received: from marcel-macbook.holtmann.net (p5b3d235a.dip0.t-ipconnect.de [91.61.35.90])
        by mail.holtmann.org (Postfix) with ESMTPSA id B0B0FCECF3;
        Sun, 11 Apr 2021 14:04:36 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH][next] Bluetooth: virtio_bt: add missing null pointer
 check on alloc_skb call return
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210409165314.671165-1-colin.king@canonical.com>
Date:   Sun, 11 Apr 2021 13:56:52 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4EC34C12-20A9-4EB2-B699-332F0CE3A38F@holtmann.org>
References: <20210409165314.671165-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

> The call to alloc_skb with the GFP_KERNEL flag can return a null sk_buff
> pointer, so add a null check to avoid any null pointer deference issues.
> 
> Addresses-Coverity: ("Dereference null return value")
> Fixes: afd2daa26c7a ("Bluetooth: Add support for virtio transport driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/virtio_bt.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

