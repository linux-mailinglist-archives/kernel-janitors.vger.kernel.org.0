Return-Path: <kernel-janitors+bounces-625-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E870580AEAD
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 22:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14AC281BAF
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 21:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D29B584DB;
	Fri,  8 Dec 2023 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YA9tbKxQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AC6171E
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 13:14:39 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id BiBArXEXv6wd8BiBArcoqg; Fri, 08 Dec 2023 22:14:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702070077;
	bh=OSfT9UUTVP3S0ETwx/bEjFBY0k8izq+yDvbqpxXsp10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YA9tbKxQ9GlQNsWmMs+WlDF7+H31hgUwZTW5yT0kyy1UJIm9kvxdK+41OfOTicBoI
	 heqwdIxv4+nlwVSOGUPAtMuiDwrBILZvaUEbHo0stqfJzV7GwhZlgQxGBOjuOktbkg
	 zUZ21OWbk+UoipWnYYyqB042Iz1F7E0Iua2C8XlSNXYbxWUwfYBz3ghald5kAQYKup
	 VDFJ6Z76DZkczzOv3RQqk9GENVQ7qToEQCxpIOqoTGsO+ABZ3bGVBtzBAqZReFS/xB
	 AO+xMwxli2DmDxEL6iUXDce/nFWJIEc8VC9mOXj6GL1XtMmGhV1DX94P1NLEebFjWA
	 /70T/z2gjl6Ug==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 08 Dec 2023 22:14:37 +0100
X-ME-IP: 92.140.202.140
Message-ID: <7fee5580-37ad-4c0a-b1d2-f45b592f86a4@wanadoo.fr>
Date: Fri, 8 Dec 2023 22:14:35 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] VMCI: Remove handle_arr_calc_size()
Content-Language: fr, en-US
To: Kees Cook <keescook@chromium.org>
Cc: Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
 <202312081258.85F7D88E@keescook>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <202312081258.85F7D88E@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/12/2023 à 21:59, Kees Cook a écrit :
> On Fri, Dec 08, 2023 at 09:46:09PM +0100, Christophe JAILLET wrote:
>> Use struct_size() instead of handle_arr_calc_size().
>> This is much more conventionnal.
>>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Looks good. And since capacity in u32, there's no need for size_add().

Hmm,

isn't u32 + u32 --> u32, so can overflow?
If I understand correctly, the type promotion to size_t will occur after 
the addition.

So size_add() looks needed, or I missed something?

CJ

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 


