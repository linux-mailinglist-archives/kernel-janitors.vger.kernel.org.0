Return-Path: <kernel-janitors+bounces-135-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485507DFF3F
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 07:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00E8D281D7F
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 06:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23141C08;
	Fri,  3 Nov 2023 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="diOpSTwX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1A7E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 06:52:14 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C317D7C
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 23:52:01 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yo22qYVa0AjXCyo23qif6F; Fri, 03 Nov 2023 07:51:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698994319;
	bh=n3o0U+wAFJJNSDWSL3836YjnJRjiy8QhH+Wkq/Yn51o=;
	h=From:To:Cc:Subject:Date;
	b=diOpSTwXP/J+BlqjMz2GK0G4WL37Q0A9k7gZjINd9ID5+BcMHrMnLHajr04Y/yaTi
	 24jR7sPTfQPOYIMXn0xrk4agCJg6SXzuIY2fsB11cMKYTCjB1Iw2R/BTErCj2XEXjJ
	 BEJpvIqdUmL4yU3lD06geJdW86LJOMqflhEl8SUVNueC2ZfZ+UdX+uF5N0AuWavuB7
	 bOl62rmtodGA6ENCwnGN4w7y+4MYSU56+IRQxl41tcOvkZowuKGrTr5nkMpdUE/NjX
	 jBJFnD597guFynfG3xd+i9CyOmI6u2611RQbGm1hKYDZ3Klq/i/jdCGRSxsiLwfo9+
	 3+0SrekV5Q6Ww==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 03 Nov 2023 07:51:59 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	keescook@chromium.org,
	willy@infradead.org,
	senozhatsky@chromium.org
Cc: list@mail.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] xhci: Shrink struct xhci_interval_bw
Date: Fri,  3 Nov 2023 07:51:46 +0100
Message-Id: <cbce7d95783a259f11ab2dc917cbee49cb5b754d.1698994203.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct xhci_interval_bw can be reordered to shrink it from 40 to 32
bytes.
This makes sense because it is used in struct xhci_interval_bw_table in an
array of XHCI_MAX_INTERVAL (i.e. 16) values. So this struct is shrunk by
128 bytes and is more cacheline friendly.

On x86_64 we have:

struct xhci_interval_bw {
	unsigned int               num_packets;          /*     0     4 */

	/* XXX 4 bytes hole, try to pack */

	struct list_head           endpoints;            /*     8    16 */
	unsigned int               overhead[3];          /*    24    12 */

	/* size: 40, cachelines: 1, members: 3 */
	/* sum members: 32, holes: 1, sum holes: 4 */
	/* padding: 4 */
	/* last cacheline: 40 bytes */
};

After the change:
struct xhci_interval_bw {
	struct list_head           endpoints;            /*     0    16 */
	unsigned int               num_packets;          /*    16     4 */
	unsigned int               overhead[3];          /*    20    12 */

	/* size: 32, cachelines: 1, members: 3 */
	/* last cacheline: 32 bytes */
};

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/host/xhci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3ea5c092bba7..0430646a3a05 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -956,13 +956,13 @@ enum xhci_overhead_type {
 };
 
 struct xhci_interval_bw {
-	unsigned int		num_packets;
 	/* Sorted by max packet size.
 	 * Head of the list is the greatest max packet size.
 	 */
 	struct list_head	endpoints;
 	/* How many endpoints of each speed are present. */
 	unsigned int		overhead[3];
+	unsigned int		num_packets;
 };
 
 #define	XHCI_MAX_INTERVAL	16
-- 
2.34.1


