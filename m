Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA1912DED0
	for <lists+kernel-janitors@lfdr.de>; Wed,  1 Jan 2020 12:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgAALjN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 1 Jan 2020 06:39:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:47210 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAALjN (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jan 2020 06:39:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1101AAD75;
        Wed,  1 Jan 2020 11:39:12 +0000 (UTC)
Date:   Wed, 01 Jan 2020 12:39:11 +0100
Message-ID: <s5htv5f2yow.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        <kernel-janitors@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/16] ALSA: constify copied structure
In-Reply-To: <1577864614-5543-3-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
        <1577864614-5543-3-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 01 Jan 2020 08:43:20 +0100,
Julia Lawall wrote:
> 
> The azx_pcm_hw structure is only copied into another structure,
> so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied now.  Thanks.


Takashi
