Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7960273D52
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Sep 2020 10:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIVIbS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Sep 2020 04:31:18 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:32308 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgIVIbR (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Sep 2020 04:31:17 -0400
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 04:31:16 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 862D2204D5
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2020 10:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1600762911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=dTsvN22iKLBV59rJwMJBZOiZc/8nIHxI++n8Nht0ocY=;
        b=W3NsMLc6h1B5AWQx6KSl00VE7AdowHCjhjnfJPd/DqT7RiUx0aXaS5eITR6D3Hw9UwokMQ
        mSWDjWhwMMaKO2cW4bywAYtO00m8XHC75Mkv+Z/1VUtZ56q91HQwQkhXVigr2/aVvrriV5
        5L1uUbmWKTvtylJBIxX1IKAcVNdY56iK0JhaKlrIi8m5T14ShlkPRfrlePer+CcqE/BJhr
        rfkqlxROC9Ih0hP4Ke972yxoh8nknOHXs6ry/hCEfswymHzUcic0flnZRJPZeBnfVstSE8
        InOPMgGIp7yaUscPN8gJtLU344eDhS2lpPpQqb/84IvAppgtI/wAwmNGLGKvow==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Tue, 22 Sep
 2020 10:21:51 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.2044.004; Tue, 22 Sep 2020 10:21:51 +0200
From:   Walter Harms <wharms@bfs.de>
To:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: test - please ignore
Thread-Topic: test - please ignore
Thread-Index: AQHWkLls3JigCP0nKkCvTN5aOPGiuQ==
Date:   Tue, 22 Sep 2020 08:21:51 +0000
Message-ID: <1cb27e3552b24046b5da4e172caae889@bfs.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
x-tm-as-product-ver: SMEX-14.0.0.3031-8.6.1012-25680.005
x-tm-as-result: No-10--4.810000-5.000000
x-tmase-matchedrid: QAoQN8i+qe4Lg19jSn5UYxvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknItp
        XG+2w3nspw00Pm81G4FftuJwrFEhTQ0nL7ev9Tv6/PPMIVQN/dXemP6O0XJrfuTCMddcL/gjsjv
        NV98mpPP8MzFj7/FJkkgODat+3+Wfr0oBxYO9pbJa0KauJKMo7bz9k5GRjAslN1pRFGSs9tESqY
        jk3fnDyLppqnzBg9PkSY5jHiC5roY=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--4.810000-5.000000
x-tmase-version: SMEX-14.0.0.3031-8.6.1012-25680.005
x-tm-snts-smtp: 01C8AE6A83286FAEAC08667F607A870D6E2CADE296C90AA2B9F8F07FEA7EA7A62000:9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=0.00
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [0.00 / 7.00];
         ARC_NA(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_ONE(0.00)[1];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.717];
         TO_DN_EQ_ADDR_ALL(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[]
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

test=
