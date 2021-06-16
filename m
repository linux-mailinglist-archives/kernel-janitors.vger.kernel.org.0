Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38393AA0D7
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Jun 2021 18:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbhFPQI6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Jun 2021 12:08:58 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59058 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhFPQI6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Jun 2021 12:08:58 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id B0BC4CED0B;
        Wed, 16 Jun 2021 18:14:50 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: btmrvl: remove redundant continue statement
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210616130757.10084-1-colin.king@canonical.com>
Date:   Wed, 16 Jun 2021 18:06:48 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <0D69851D-A632-4AED-8DB2-86EC0EC4D621@holtmann.org>
References: <20210616130757.10084-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

> The continue statement in the for-loop has no effect,
> remove it.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btmrvl_sdio.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

