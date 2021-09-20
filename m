Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3E841263A
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Sep 2021 20:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385990AbhITS4a (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Sep 2021 14:56:30 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:39484
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1385710AbhITSv4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Sep 2021 14:51:56 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 5636A3F070;
        Mon, 20 Sep 2021 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632163828;
        bh=hWL01eU+1x8jZvPaNXNGLcO6ryJi/d3u2BcpeV4Iedw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=u+lNmK6LN5+EzY3T/OYTyWigcduw1rxE+le88nYqE2NOJDtCkkBKd0n8b4O6BIelu
         zMRTKczs8PF/V2tYGN4skVrFyHI15EQwc4SJNla10KMpVWAeB0mgdLb9zEnyR5hfuh
         xPmmTKAtFiyOMvSdhkDBq/09LOvG5D3Crnu7LfY4+/56OY1AL45Xe1CHZU81WMaBls
         Qz33AYj4VloPYZozeGgCwDLKtIn4HP1n6eqKa+YjjejfowKdRcBfdgfmbxAjPPdOGN
         54rqgOlLZoOYIK6nx2SsucsnmhHCwx/2trReIAkPZRzUL1tkg1/dhCwhYu/utOL7fT
         WkdnInaucwkkg==
From:   Colin King <colin.king@canonical.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: ACPI: Fix spelling mistake "Millenium" -> "Millennium"
Date:   Mon, 20 Sep 2021 19:50:28 +0100
Message-Id: <20210920185028.18738-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the documentation with the Windows
Millennium edition. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/firmware-guide/acpi/osi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/firmware-guide/acpi/osi.rst b/Documentation/firmware-guide/acpi/osi.rst
index 29e9ef79ebc0..05869c0045d7 100644
--- a/Documentation/firmware-guide/acpi/osi.rst
+++ b/Documentation/firmware-guide/acpi/osi.rst
@@ -74,7 +74,7 @@ The ACPI BIOS flow would include an evaluation of _OS, and the AML
 interpreter in the kernel would return to it a string identifying the OS:
 
 Windows 98, SE: "Microsoft Windows"
-Windows ME: "Microsoft WindowsME:Millenium Edition"
+Windows ME: "Microsoft WindowsME:Millennium Edition"
 Windows NT: "Microsoft Windows NT"
 
 The idea was on a platform tasked with running multiple OS's,
-- 
2.32.0

