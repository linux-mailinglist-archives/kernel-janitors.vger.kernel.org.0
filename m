Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374D63B8D8F
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Jul 2021 07:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhGAGBA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Jul 2021 02:01:00 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:17958 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhGAGBA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jul 2021 02:01:00 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d58 with ME
        id PhyS2500S21Fzsu03hyTkK; Thu, 01 Jul 2021 07:58:28 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Jul 2021 07:58:28 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     csully@google.com, sagis@google.com, jonolson@google.com,
        davem@davemloft.net, kuba@kernel.org, awogbemila@google.com,
        willemb@google.com, yangchun@google.com, bcf@google.com,
        kuozhao@google.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] gve: Fixes and clean-up
Date:   Thu,  1 Jul 2021 07:58:25 +0200
Message-Id: <cover.1625118581.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This serie is part of the effort to axe the wrappers in
include/linux/pci-dma-compat.h

While looking at it, I spotted:
  - a resource leak in an error handling path (patch 1)
  - an error code that could be propagated. (patch 2)
    This patch could be ignored. It's only goal is to be more consistent
    with other drivers.

These 2 paches are not related to the 'pci-dma-compat.h' stuff, which can
be found in patch 3.

Christophe JAILLET (3):
  gve: Fix an error handling path in 'gve_probe()'
  gve: Propagate error codes to caller
  gve: Simplify code and axe the use of a deprecated API

 drivers/net/ethernet/google/gve/gve_main.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.30.2

