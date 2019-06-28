Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A99B59820
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Jun 2019 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfF1KEU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 28 Jun 2019 06:04:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:34660 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726520AbfF1KEU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Jun 2019 06:04:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CED6AB123;
        Fri, 28 Jun 2019 10:04:18 +0000 (UTC)
Date:   Fri, 28 Jun 2019 12:04:18 +0200
Message-ID: <s5h8stm6n6l.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Colin King <colin.king@canonical.com>
Cc:     <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: seq: fix incorrect order of dest_client/dest_ports arguments
In-Reply-To: <20190628095429.13369-1-colin.king@canonical.com>
References: <20190628095429.13369-1-colin.king@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 28 Jun 2019 11:54:29 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two occurrances of a call to snd_seq_oss_fill_addr where
> the dest_client and dest_port arguments are in the wrong order. Fix
> this by swapping them around.
> 
> Addresses-Coverity: ("Arguments in wrong order")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
