Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F40700264
	for <lists+kernel-janitors@lfdr.de>; Fri, 12 May 2023 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239919AbjELIS6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 12 May 2023 04:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239930AbjELIS5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 May 2023 04:18:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638ED4488
        for <kernel-janitors@vger.kernel.org>; Fri, 12 May 2023 01:18:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1C6F020413;
        Fri, 12 May 2023 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683879535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pHVVEhj71TC5ei0Y7OES5Dbgca5o5EL3xb2/itYcJ0Y=;
        b=KuhOTEmAL4pz5kmY8i0dgeAn/rR9lsUkJRLIwH7Z+xh6Cst0lh9J071NEpB6OT8kASJubS
        /fslgokY1Z9XkE3bVTSVTMlK0jbb4+D9FwYfBoFQ61Gz34bPWn/ED054hxuRnSTYIudPC5
        Xdm2mFse4BgoxYwEDvm87+xfPxZ1bOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683879535;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pHVVEhj71TC5ei0Y7OES5Dbgca5o5EL3xb2/itYcJ0Y=;
        b=GkmGUlMAOQpLCF5jriMdUR0ztxRyVPlblX6Wsfh0YPl3BEijFIyDqug5qwTPwHQrnD8gx6
        o+R7lduFXbQy6RAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E21BB13466;
        Fri, 12 May 2023 08:18:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id o2hNNm72XWTLHQAAMHmgww
        (envelope-from <tiwai@suse.de>); Fri, 12 May 2023 08:18:54 +0000
Date:   Fri, 12 May 2023 10:18:54 +0200
Message-ID: <873542aro1.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
In-Reply-To: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
References: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 09 May 2023 11:07:11 +0200,
Dan Carpenter wrote:
> 
> This code was supposed to return an error code if init_stream()
> failed, but it instead freed dg00x->rx_stream and returned success.
> This potentially leads to a use after free.
> 
> Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, applied now.


Takashi
