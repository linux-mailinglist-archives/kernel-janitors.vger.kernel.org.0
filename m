Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89FD812DE4D
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Jan 2020 09:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgAAIUK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Jan 2020 03:20:10 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:56920 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725783AbgAAIUK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jan 2020 03:20:10 -0500
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; 
   d="scan'208";a="429578749"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256; 01 Jan 2020 09:20:08 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] ALSA: ad1816a: constify copied structure
Date:   Wed,  1 Jan 2020 08:43:19 +0100
Message-Id: <1577864614-5543-2-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The snd_ad1816a_timer_table structure is only copied into
another structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/isa/ad1816a/ad1816a_lib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index e1aa5372c483..da6f68b8c248 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -409,7 +409,7 @@ static int snd_ad1816a_timer_stop(struct snd_timer *timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_ad1816a_timer_table = {
+static const struct snd_timer_hardware snd_ad1816a_timer_table = {
 	.flags =	SNDRV_TIMER_HW_AUTO,
 	.resolution =	10000,
 	.ticks =	65535,

