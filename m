Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98908844BE
	for <lists+kernel-janitors@lfdr.de>; Wed,  7 Aug 2019 08:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfHGGpN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 7 Aug 2019 02:45:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34109 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfHGGpN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Aug 2019 02:45:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so39241447plt.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Aug 2019 23:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdLMdQs77H7q7Rq2wkhxXRQ+8UWJlMaRb3upsqZ7Sdo=;
        b=SiAQfUqjlfFhnpJ/aiiBbpttxqd+ElFAQ2jLMiJWw1CK7OaWHvfPVVo8xTnVfnqO5n
         VPqr7FMg+jewdzjeXHchHJdocsBuVD3s7JgU5oBf6sRlrX+rlaja5P460LkECuoiLfvp
         Jrj4oDZ6vlTTCQLew7cix7sQcLaUjMzBb8/3Tk04zQh7aPzogHaQVDJHtMPDEGS6gOOn
         SnqZW3tnd4J/FfksKdEskh1toJpfXlwnRy9AhH6Q5qIkPwUJjNYSVxuyVN/Lxt1drAn2
         nLwGokkYmZRW9y5mPyRUdHK+zuxE02J4hOGFff4TykU0s42fmsYhKJgFhIYt2mGAg10q
         4ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdLMdQs77H7q7Rq2wkhxXRQ+8UWJlMaRb3upsqZ7Sdo=;
        b=THTUJMOqMf38/jwxMvbJyt5+eo7F9pwuvRE7ylUT8bGQU8DirHK5Ahcaiy4Hvol74o
         N0pH3aDDY2ApHpAFc3PGyI5YPiJZjQ7s0sU8wAaixrfpfxAS1fb/h66KrXyZkJVOFTgN
         LGyIV6gjCB52QbqIeQJbBk6d927ETxr+rg4FYmEs6mJbc8NKKgscLk/Rr6F9bJrZ8Fik
         PwMJnQPmb07mOib2L0rPekqItrjX7CL9Iedb5uVmYi/hGokJgYqKgs8Dfah3ZudqWZQf
         5OM1xyPji8b4gJaYcGQc0hSVZRTkB+VFTlct2rJHAAlLWz99KwUqJQKtREABIhhotaDl
         pJeA==
X-Gm-Message-State: APjAAAXb06LsGvtWwpxsRcrkt8zcdQrybrPOCl7EG/LrHOpLhqs3uWmh
        +glaD6qd06VvbqkUti35R5nFQ4nktoE=
X-Google-Smtp-Source: APXvYqwWtL2V/FMBAor8U+S42IBOAUWMbGYvY2K3OKGlltXwE6PjxYTU2fLTNPsUaHw6i/rYJPoLkA==
X-Received: by 2002:a62:2a4d:: with SMTP id q74mr7838996pfq.86.1565160312706;
        Tue, 06 Aug 2019 23:45:12 -0700 (PDT)
Received: from FINLAND.cbr.squiz.net.au (220-245-33-70.static.tpgi.com.au. [220.245.33.70])
        by smtp.gmail.com with ESMTPSA id y22sm104846552pfo.39.2019.08.06.23.45.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 23:45:12 -0700 (PDT)
From:   Adam Zerella <adam.zerella@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH] pcmcia/i82092: Refactored dprintk macro for pr_debug.
Date:   Tue,  6 Aug 2019 23:04:47 +1000
Message-Id: <20190806130445.3785-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

As pointed out in https://kernelnewbies.org/KernelJanitors/Todo
this patch replaces the outdated macro of DPRINTK for pr_debug

E: example patch (Testing to see if this format and type of fix is welcome)
To: Dominik Brodowski <linux@dominikbrodowski.net>
To: Thomas Gleixner <tglx@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adam Zerella <adam.zerella@gmail.com>
To: linux-kernel@vger.kernel.org
Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 drivers/pcmcia/i82092.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pcmcia/i82092.c b/drivers/pcmcia/i82092.c
index ec54a2aa5cb8..e1929520c20e 100644
--- a/drivers/pcmcia/i82092.c
+++ b/drivers/pcmcia/i82092.c
@@ -117,9 +117,9 @@ static int i82092aa_pci_probe(struct pci_dev *dev, const struct pci_device_id *i
 		
 		if (card_present(i)) {
 			sockets[i].card_state = 3;
-			dprintk(KERN_DEBUG "i82092aa: slot %i is occupied\n",i);
+			pr_debug("i82092aa: slot %i is occupied\n", i);
 		} else {
-			dprintk(KERN_DEBUG "i82092aa: slot %i is vacant\n",i);
+			pr_debug("i82092aa: slot %i is vacant\n", i);
 		}
 	}
 		
@@ -128,7 +128,7 @@ static int i82092aa_pci_probe(struct pci_dev *dev, const struct pci_device_id *i
 	pci_write_config_byte(dev, 0x50, configbyte); /* PCI Interrupt Routing Register */
 
 	/* Register the interrupt handler */
-	dprintk(KERN_DEBUG "Requesting interrupt %i \n",dev->irq);
+	pr_debug("Requesting interrupt %i\n", dev->irq);
 	if ((ret = request_irq(dev->irq, i82092aa_interrupt, IRQF_SHARED, "i82092aa", i82092aa_interrupt))) {
 		printk(KERN_ERR "i82092aa: Failed to register IRQ %d, aborting\n", dev->irq);
 		goto err_out_free_res;
-- 
2.20.1

