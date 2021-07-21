Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02673D1076
	for <lists+kernel-janitors@lfdr.de>; Wed, 21 Jul 2021 16:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbhGUNX1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 21 Jul 2021 09:23:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50076 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbhGUNX1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Jul 2021 09:23:27 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 53D4422542;
        Wed, 21 Jul 2021 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626876243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s9o5gw9ee0BD/0Um0CZpQOb6GDHM/3tjfz/lIISVRp4=;
        b=WSGqcjGOyZEsx6Msf22k8vBCsvlqjB1aMEC+ueHQAA6GBdDMcYCaDT27zTsKALJdGMqlLp
        X2BXa6xBXJggy9+hLHpOSYCtb+qz26ajjD6CcpVHD1gw6eFrwiGpoSMVLKngqsO+zsE/rT
        hBwGuZxouGBZ3c/ZKRCfWZdeDhu5xMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626876243;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s9o5gw9ee0BD/0Um0CZpQOb6GDHM/3tjfz/lIISVRp4=;
        b=epxNEq9ZSIqRgjr4zKxlLV7S9yYYHwkZ7xYZG1bT186rj4q/B7vGzhZMQ3UQUzBcm+SC6V
        0N2EI5GsVBB8SNBA==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 3E053A3B84;
        Wed, 21 Jul 2021 14:04:03 +0000 (UTC)
Date:   Wed, 21 Jul 2021 16:04:03 +0200
Message-ID: <s5heebrlq5o.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Leon Romanovsky <leon@kernel.org>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: korg1212: Fix crash in snd_korg1212_create()
In-Reply-To: <20210721140122.GA5251@kili>
References: <20210721140122.GA5251@kili>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 21 Jul 2021 16:01:22 +0200,
Dan Carpenter wrote:
> 
> The "dsp_code" is not initialized until the next line so we can't
> dereference it.
> 
> Fixes: b5cde369b618 ("ALSA: korg1212: Allocate resources with device-managed APIs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, it's already addressed by commit d364a600d6ed.


Takashi
