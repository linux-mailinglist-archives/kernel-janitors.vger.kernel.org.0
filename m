Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4951F351
	for <lists+kernel-janitors@lfdr.de>; Wed, 15 May 2019 14:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfEOMNC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 15 May 2019 08:13:02 -0400
Received: from mail.skyhub.de ([5.9.137.197]:57740 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727269AbfEOMM5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 May 2019 08:12:57 -0400
Received: from zn.tnic (p200300EC2F0A7C00329C23FFFEA6A903.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:7c00:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0DC2E1EC0283;
        Wed, 15 May 2019 14:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1557922376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:references;
        bh=WvJVj7h798nwLewX6tRbjM3FogL3I2Jr97HhbpLU4k4=;
        b=XZeNYCsAE9quqjT+NQ+FtYeMwOY7FpsCU/+o4H7j32pRxFWQgkeuhfcG5GUnAl7MmOiRUc
        pV1dFf8MgEA91vZHsQ7ngMDi6lqvRWr6WnssjqLNLZT2b2o+5A722RhWywvTAXXmcQ5xqo
        szD02RRK+D6ICwQQEfyxB+IP3fQImxI=
Date:   Wed, 15 May 2019 14:12:48 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     kernel-janitors@vger.kernel.org
Subject: Spelling fixes for new people to get involved
Message-ID: <20190515121247.GF24212@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

if you grep the kernel tree for the word "compliment":

$ git grep compliment
arch/nios2/include/asm/asm-macros.h:126: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/nios2/include/asm/asm-macros.h:189: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/nios2/include/asm/asm-macros.h:202: * Tests the bit in reg2 and then compliments the bit in reg2.
arch/powerpc/platforms/pseries/mobility.c:82:    * A negative value is also the two's compliment of the actual value.
drivers/block/rsxx/config.c:48:  * Return the compliment of the CRC to ensure compatibility
drivers/block/skd_main.c:2039:  /* Note that the compliment of mask is written. A 1-bit means
...

you'll see that in almost all cases, the word the author meant to use
was "complement", with an 'e'.

I think the respective maintainer wouldn't mind a patch fixing that in their
driver/subsystem. :-)

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
