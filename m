Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A093ECE08
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Aug 2021 07:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhHPFZh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Aug 2021 01:25:37 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:37533 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhHPFZh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Aug 2021 01:25:37 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d03 with ME
        id i5R22500B3riaq2035R2Vr; Mon, 16 Aug 2021 07:25:04 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Aug 2021 07:25:04 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, vkoul@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] ASoC: wcd9335: Firx some resources leak in the probe and remove function
Date:   Mon, 16 Aug 2021 07:25:01 +0200
Message-Id: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The first 2 patches are sraightforward and look logical to me.

However, the 3rd one in purely speculative. It is based on the fact that a
comment states that we enable some irqs on some slave ports. That said, it writes
0xFF in some registers.

So, I guess that we should disable these irqs when the driver is removed. That
said, writing 0x00 at the same place looks logical to me.

This cis untested and NOT based on any documentation. Just a blind fix.
Review with care.
You'll be warned :)


Christophe JAILLET (3):
  ASoC: wcd9335: Fix a double irq free in the remove function
  ASoC: wcd9335: Fix a memory leak in the error handling path of the
    probe function
  ASoC: wcd9335: Disable irq on slave ports in the remove function

 sound/soc/codecs/wcd9335.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

-- 
2.30.2

