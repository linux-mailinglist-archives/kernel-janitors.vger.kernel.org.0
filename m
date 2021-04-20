Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AA4365B9F
	for <lists+kernel-janitors@lfdr.de>; Tue, 20 Apr 2021 16:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhDTPAT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 20 Apr 2021 11:00:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:43068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232778AbhDTPAS (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 11:00:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E1153B2F2;
        Tue, 20 Apr 2021 14:59:45 +0000 (UTC)
Date:   Tue, 20 Apr 2021 16:59:45 +0200
Message-ID: <s5hczupc87y.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb: midi: don't return -ENOMEM when usb_urb_ep_type_check fails
In-Reply-To: <20210420134719.381409-1-colin.king@canonical.com>
References: <20210420134719.381409-1-colin.king@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 20 Apr 2021 15:47:19 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to usb_urb_ep_type_check fails (returning -EINVAL)
> the error return path returns -ENOMEM via the exit label "error". Other
> uses of the same error exit label set the err variable to -ENOMEM but this
> is not being used.  I believe the original intent was for the error exit
> path to return the value in err rather than the hard coded -ENOMEM, so
> return this rather than the hard coded -ENOMEM.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 738d9edcfd44 ("ALSA: usb-audio: Add sanity checks for invalid EPs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
