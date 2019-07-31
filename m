Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69A87C22D
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jul 2019 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfGaMvY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 31 Jul 2019 08:51:24 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:33566 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726248AbfGaMvY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Jul 2019 08:51:24 -0400
Received: from localhost.localdomain ([176.167.121.156])
        by mwinf5d70 with ME
        id jQrL200103NZnML03QrMNe; Wed, 31 Jul 2019 14:51:22 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 31 Jul 2019 14:51:22 +0200
X-ME-IP: 176.167.121.156
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] usb: xhci: dbc: 2 smalll fixes for 'xhci_dbc_alloc_requests()'
Date:   Wed, 31 Jul 2019 14:51:26 +0200
Message-Id: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Christophe JAILLET (2):
  usb: xhci: dbc: Simplify error handling in 'xhci_dbc_alloc_requests()'
  usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in
    'xhci_dbc_alloc_requests()'

 drivers/usb/host/xhci-dbgtty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1

