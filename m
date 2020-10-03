Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8232821C3
	for <lists+kernel-janitors@lfdr.de>; Sat,  3 Oct 2020 07:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgJCF5R (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 3 Oct 2020 01:57:17 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:50674 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCF5R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 3 Oct 2020 01:57:17 -0400
Received: from localhost.localdomain ([93.22.132.169])
        by mwinf5d15 with ME
        id bHxC230073fShfh03HxCuY; Sat, 03 Oct 2020 07:57:14 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 03 Oct 2020 07:57:14 +0200
X-ME-IP: 93.22.132.169
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     intel-linux-scu@intel.com, artur.paszkiewicz@intel.com,
        jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] scsi: isci: Fix a typo in a comment
Date:   Sat,  3 Oct 2020 07:57:09 +0200
Message-Id: <20201003055709.766119-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

s/remtoe/remote/
and add a missing '.'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/isci/remote_node_table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/isci/remote_node_table.h b/drivers/scsi/isci/remote_node_table.h
index 721ab982d2ac..0ddfdda2b248 100644
--- a/drivers/scsi/isci/remote_node_table.h
+++ b/drivers/scsi/isci/remote_node_table.h
@@ -61,7 +61,7 @@
 /**
  *
  *
- * Remote node sets are sets of remote node index in the remtoe node table The
+ * Remote node sets are sets of remote node index in the remote node table. The
  * SCU hardware requires that STP remote node entries take three consecutive
  * remote node index so the table is arranged in sets of three. The bits are
  * used as 0111 0111 to make a byte and the bits define the set of three remote
-- 
2.25.1

