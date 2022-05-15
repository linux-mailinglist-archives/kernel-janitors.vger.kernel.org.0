Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9CC5279B8
	for <lists+kernel-janitors@lfdr.de>; Sun, 15 May 2022 22:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiEOUHw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 15 May 2022 16:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiEOUHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 15 May 2022 16:07:49 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57960F588
        for <kernel-janitors@vger.kernel.org>; Sun, 15 May 2022 13:07:46 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nqKWh-00069N-AL; Sun, 15 May 2022 22:07:39 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sandy Huang <hjc@rock-chips.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
Date:   Sun, 15 May 2022 22:07:37 +0200
Message-Id: <165264524621.2584623.18007054358707398354.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YnjZQRV9lpub2ET8@kili>
References: <YnjZQRV9lpub2ET8@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 9 May 2022 12:05:05 +0300, Dan Carpenter wrote:
> This error path needs an unlock before returning.

Applied, thanks!

[1/1] drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
      commit: 98526c5bbe3267d447ddd076b685439e3e1396c6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
