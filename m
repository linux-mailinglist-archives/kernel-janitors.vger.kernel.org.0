Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6429C5BDF77
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Sep 2022 10:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiITINQ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 20 Sep 2022 04:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbiITIMv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Sep 2022 04:12:51 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E3132EEA
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Sep 2022 01:11:05 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D6D761C0010;
        Tue, 20 Sep 2022 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1663661462;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oZqxS1EvzHcciFqs++tYbF63gvbeqlta9q1Lwv7duqo=;
        b=oj2qJiKojDbd1YvWqFDW4tgIC+KCp329ZGG4jO7JnbKXv2i0CuNFDSDVDOYGtsw0UuTZz+
        GSkmlFe1h27/l2YyO3vRnE2d7xoM0c7AaL3fHKFNGlaDPQqWjFziwikojJstEtLpxy3RqU
        3MZIfYseP0f86jgTmb5NPbm2PzE0iC/AyLgp/yc+1c/l7TV1FRSo2+kSARHN0hQN/Er5bT
        hTyzKbg7D7CoZorHMSusBVJs1rR1bUCpYCRd94UDswsGbZYmaoWTNe9eMwOiRjx1XTolEh
        bU7xvsWPBdRVJbEuqTRXMxNZdMMd9DA7iNG3j13i5cAFmh3uWfU7H/iJ2tjilQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liang Yang <liang.yang@amlogic.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yixun Lan <yixun.lan@amlogic.com>,
        linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
Date:   Tue, 20 Sep 2022 10:10:58 +0200
Message-Id: <20220920081058.597332-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <YuI2zF1hP65+LE7r@kili>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'768e08b34f5733d538f9fb6029a650332ac143dd'
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2022-07-28 at 07:12:12 UTC, Dan Carpenter wrote:
> The meson_nfc_ecc_correct() function accidentally does a right shift
> instead of a left shift so it only works for BIT(0).  Also use
> BIT_ULL() because "correct_bitmap" is a u64 and we want to avoid
> shift wrapping bugs.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
