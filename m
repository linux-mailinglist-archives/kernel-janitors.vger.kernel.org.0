Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678C91DE51A
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 May 2020 13:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgEVLJh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 May 2020 07:09:37 -0400
Received: from mx01-muc.bfs.de ([193.174.230.67]:14239 "EHLO mx01-muc.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728281AbgEVLJg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 May 2020 07:09:36 -0400
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 May 2020 07:09:31 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-muc.bfs.de (Postfix) with ESMTPS id 9794D201B6;
        Fri, 22 May 2020 13:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1590145216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dIJHUIBAcLdiz1lV9ZaAfHffI+g5s/1QjyoOBtqepXk=;
        b=g1RkvOm4+Q37oUO2kLn6kWPhLUC0BrU0nLN+8uxvVKIjy2AVFKQfwqgh7XHsTZdd5MkCvD
        44sbnEgGQ9RaSYMbCe4UT/SrXjwrY8HG1zFrOeEr8t9+frfQysTIojJ1vPRz+j9hcYjG3S
        FQY/S6K6FyRQLQoSXbyAZDgHLTKdb8uY6a2UugrpuGu1BCLSABJGNsjWbVQ32ELTRbJGsV
        STibYrtu4mUImL2LdApx88dISPB6NLCaXqA73BKg53AKT+v6zAw+X2pqBRHu+49HKDnFN/
        AYtcvYa38IoDK6Jd3SEZnqekaC3iWrL2yO6QWDXpoDICzqMTUhZucRhW/F/B/A==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 22 May
 2020 13:00:15 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Fri, 22 May 2020 13:00:15 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "oshpigelman@habana.ai" <oshpigelman@habana.ai>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: AW: [bug report] habanalabs: add gaudi security module
Thread-Topic: [bug report] habanalabs: add gaudi security module
Thread-Index: AQHWMB9bUn6ofMAH9UmrfT11Ggg2Jaiz7QCX
Date:   Fri, 22 May 2020 11:00:15 +0000
Message-ID: <0a05fa8a8bd94e5c9b2a4dd0c8e541fd@bfs.de>
References: <20200522095640.GA32453@mwanda>
In-Reply-To: <20200522095640.GA32453@mwanda>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.32
Authentication-Results: mx01-muc.bfs.de;
        none
X-Spamd-Result: default: False [-2.32 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.979];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.32)[96.81%]
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


This line looks strange (read: does not fit pattern) also:
 pb_addr =3D (mmMME0_CTRL_SHADOW_0_STATUS & ~0xFFF) + PROT_BITS_OFFS;

perhaps the intention was to set bits ?
pb_addr =3D (mmMME0_CTRL_SHADOW_0_STATUS & ~0xFFF) | PROT_BITS_OFFS;

jm2c,

re,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Dan Carpenter <dan.carpenter@oracle.com>
Gesendet: Freitag, 22. Mai 2020 11:56:40
An: oshpigelman@habana.ai
Cc: Omer Shpigelman; kernel-janitors@vger.kernel.org
Betreff: [bug report] habanalabs: add gaudi security module

Hello Omer Shpigelman,

The patch 3a3a5bf19639: "habanalabs: add gaudi security module" from
May 11, 2020, leads to the following static checker warning:

        drivers/misc/habanalabs/gaudi/gaudi_security.c:527 gaudi_init_mme_p=
rotection_bits()
        warn: odd binop '0x60400 & 0x7f'

drivers/misc/habanalabs/gaudi/gaudi_security.c
   514          mask |=3D 1 << ((mmMME0_CTRL_TE_CLOSE_CGATE & 0x7F) >> 2);
   515          mask |=3D 1 << ((mmMME0_CTRL_AGU_SM_INFLIGHT_CNTR & 0x7F) >=
> 2);
   516          mask |=3D 1 << ((mmMME0_CTRL_AGU_SM_TOTAL_CNTR & 0x7F) >> 2=
);
   517          mask |=3D 1 << ((mmMME0_CTRL_EZSYNC_OUT_CREDIT & 0x7F) >> 2=
);
   518          mask |=3D 1 << ((mmMME0_CTRL_PCU_RL_SAT_SEC & 0x7F) >> 2);
   519          mask |=3D 1 << ((mmMME0_CTRL_AGU_SYNC_MSG_AXI_USER & 0x7F) =
>> 2);
   520          mask |=3D 1 << ((mmMME0_CTRL_QM_SLV_LBW_CLK_EN & 0x7F) >> 2=
);
   521
   522          WREG32(pb_addr + word_offset, ~mask);
   523
   524          pb_addr =3D (mmMME0_CTRL_SHADOW_0_STATUS & ~0xFFF) + PROT_B=
ITS_OFFS;
   525          word_offset =3D ((mmMME0_CTRL_SHADOW_0_STATUS & PROT_BITS_O=
FFS) >> 7)
   526                          << 2;
   527          mask =3D 1 << ((mmMME0_CTRL_SHADOW_0_STATUS & 0x7F) >> 2);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is zero.

   528
   529          WREG32(pb_addr + word_offset, ~mask);
   530
   531          pb_addr =3D (mmMME0_QM_GLBL_CFG0 & ~0xFFF) + PROT_BITS_OFFS=
;
   532          word_offset =3D ((mmMME0_QM_GLBL_CFG0 & PROT_BITS_OFFS) >> =
7) << 2;
   533          mask =3D 1 << ((mmMME0_QM_GLBL_CFG0 & 0x7F) >> 2);
   534          mask |=3D 1 << ((mmMME0_QM_GLBL_CFG1 & 0x7F) >> 2);

There are a about 300 similar warnings.

drivers/misc/habanalabs/gaudi/gaudi_security.c:527 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x60400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:532 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:533 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:567 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:604 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:624 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:657 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:695 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:733 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:763 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:821 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:846 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:879 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:899 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:920 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0x68d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:962 gaudi_init_mme_protectio=
n_bits() warn: odd binop '0xe0400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1006 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x160400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1011 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1012 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1046 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1083 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1103 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1136 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1174 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1212 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1242 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1300 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1326 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1359 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1379 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1400 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x168d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1442 gaudi_init_mme_protecti=
on_bits() warn: odd binop '0x1e0400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1489 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1490 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1524 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1561 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1581 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1614 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1652 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1691 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1721 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1779 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1805 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1838 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1858 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1879 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x508d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1884 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1885 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1919 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1956 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:1976 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2009 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2047 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2086 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2116 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2174 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2201 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2234 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2254 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2275 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x528d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2280 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2281 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2315 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2352 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2372 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2405 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2443 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2482 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2512 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2570 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2597 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2630 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2650 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2671 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x548d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2676 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2677 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2711 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2748 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2768 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2801 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2839 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2878 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2908 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2966 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:2993 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3026 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3046 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3067 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x568d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3072 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3073 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3107 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3144 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3164 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3197 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3235 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3274 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3304 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3362 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3389 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3422 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3442 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3463 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x588d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3468 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3469 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3503 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3540 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3560 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3593 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3631 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3670 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3700 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3758 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3785 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3818 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3838 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3859 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3864 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3865 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3899 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3936 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3956 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:3989 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4027 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4066 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4096 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4154 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4181 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4214 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4234 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4255 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4260 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4261 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4295 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4332 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4352 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4385 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4423 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4462 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4492 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4550 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4577 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4610 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4630 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4651 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4656 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x500000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4657 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x500000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4674 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x500100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4705 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x500200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4721 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x520000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4722 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x520000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4739 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x520100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4770 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x520200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4786 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x540000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4787 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x540000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4804 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x540100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4834 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x540200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4850 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x560000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4851 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x560000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4868 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x560100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4898 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x560200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4914 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x580000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4915 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x580000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4932 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x580100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4962 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x580200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4978 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4979 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:4996 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5026 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5a0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5042 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5043 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5060 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5090 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5c0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5106 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e0000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5107 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e0000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5124 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e0100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5154 gaudi_init_dma_protecti=
on_bits() warn: odd binop '0x5e0200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5188 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5189 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5223 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5260 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5280 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5313 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5351 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5391 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5421 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5479 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5506 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5539 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5559 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5580 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe08d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5592 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe06900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5646 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5647 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5681 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5718 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5738 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5771 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5809 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5847 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5877 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5935 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5962 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:5995 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6015 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6036 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe48d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6048 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe46900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6102 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6103 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6137 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6174 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6194 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6227 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6265 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6303 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6333 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6391 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6417 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6450 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6470 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6491 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe88d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6503 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xe86900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6557 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6558 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6592 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6629 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6649 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6682 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6720 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6758 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6788 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6846 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6872 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6905 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6925 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6946 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:6958 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xec6900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7012 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7013 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7047 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7084 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7104 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7137 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7175 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7213 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7243 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7301 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7327 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7360 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7380 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7401 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf08d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7413 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf06900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7467 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7468 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7502 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7539 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7559 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7592 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7630 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7668 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7698 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7756 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7782 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7815 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7835 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7856 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf48d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7868 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf46900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7922 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7923 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7957 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:7994 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8014 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8047 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8085 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8123 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8153 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8211 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8238 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8271 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8291 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8313 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf88d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8325 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xf86900 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8379 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8000 & 0xf80'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8380 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8000 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8414 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8080 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8451 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8100 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8471 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8180 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8504 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8200 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8542 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8280 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8582 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8300 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8612 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8400 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8670 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8a80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8696 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8b80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8729 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8c00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8749 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8c80 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8770 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc8d00 & 0x7f'
drivers/misc/habanalabs/gaudi/gaudi_security.c:8782 gaudi_init_tpc_protecti=
on_bits() warn: odd binop '0xfc6900 & 0x7f'

regards,
dan carpenter
