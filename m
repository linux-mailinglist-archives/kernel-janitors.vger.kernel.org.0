Return-Path: <kernel-janitors+bounces-7223-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79944A49536
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 10:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F403817343B
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Feb 2025 09:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C598B25A620;
	Fri, 28 Feb 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="njaJr9d4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hh+aImYI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="njaJr9d4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hh+aImYI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57146256C86
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735312; cv=none; b=VU2dUTkpBb7d/w0KnXA+GnYtpCUFmPjvRNv7mfB1Ri6+llqJhonPPSCI+aB3ED7BaCCEYHA86IhjdKmBrWJkTUfF4UvDuS/GezcEpFc6wgRtHSYEXziOyf2H9sd2xinRHgKiigBWAn/5UAsJHUZAqCBWaDT/SM0bIoTu09OSxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735312; c=relaxed/simple;
	bh=qx4kB7+Wp/9cAXa0HJCVNip3+0uSwsWdyvnMa5GHt8o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNehL7CbKcnLrElQqFklbaK5RyqNT+8mE0QD/fPft+SwD1R63Ou/jfccKnVuC0o1KuMf4aWCYKtxsk9ifSoy9W9Ek2rKgsiwkGK46oTMgZmLMnvMxo8uMxg6Nu7Fzdt6jnnTjuq4qTxnHERfuIGKvuyNPyGlHlpqWci6L/P4lOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=njaJr9d4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hh+aImYI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=njaJr9d4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hh+aImYI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7020321162;
	Fri, 28 Feb 2025 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPJ70s22WXuNJow6kunAzPhRwBsG68rmC1IAAjRmtdM=;
	b=njaJr9d45WQROLJNo5wKFaHMo60vPSlhXsuWJiROMdSmII07dj7rFtYP3zXnfT/+fD+B0M
	kkm5SlqRPGVqoO8XKLlnzlY3LiCAeNFTg4OtLGBI0Rk103zGDfent9vbjY2b95opvqovaN
	N3zPjShDMLYYxQlqA2UXa7UAHrDJ0Qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPJ70s22WXuNJow6kunAzPhRwBsG68rmC1IAAjRmtdM=;
	b=Hh+aImYIyRlAtbz7dAnxz9ZHVZRSyUbuFDFYe/QnXkNMBtLC7glPJ0DRWB9F7XEYPBlxKm
	pv+H1rMjkT89ZBCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPJ70s22WXuNJow6kunAzPhRwBsG68rmC1IAAjRmtdM=;
	b=njaJr9d45WQROLJNo5wKFaHMo60vPSlhXsuWJiROMdSmII07dj7rFtYP3zXnfT/+fD+B0M
	kkm5SlqRPGVqoO8XKLlnzlY3LiCAeNFTg4OtLGBI0Rk103zGDfent9vbjY2b95opvqovaN
	N3zPjShDMLYYxQlqA2UXa7UAHrDJ0Qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPJ70s22WXuNJow6kunAzPhRwBsG68rmC1IAAjRmtdM=;
	b=Hh+aImYIyRlAtbz7dAnxz9ZHVZRSyUbuFDFYe/QnXkNMBtLC7glPJ0DRWB9F7XEYPBlxKm
	pv+H1rMjkT89ZBCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A96A1344A;
	Fri, 28 Feb 2025 09:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VVvMCEuDwWd0UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Feb 2025 09:35:07 +0000
Date: Fri, 28 Feb 2025 10:35:06 +0100
Message-ID: <87eczicsz9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: es18xx: Fix spelling mistake "grap" -> "grab"
In-Reply-To: <20250228083631.676877-1-colin.i.king@gmail.com>
References: <20250228083631.676877-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.73
X-Spamd-Result: default: False [-1.73 / 50.00];
	BAYES_HAM(-2.93)[99.70%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 28 Feb 2025 09:36:31 +0100,
Colin Ian King wrote:
> 
> There are spelling mistakes in dev_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, applied.


Takashi

