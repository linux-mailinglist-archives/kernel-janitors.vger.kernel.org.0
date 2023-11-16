Return-Path: <kernel-janitors+bounces-305-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F67EE1DF
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 14:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E482810E6
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Nov 2023 13:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B3730FA0;
	Thu, 16 Nov 2023 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="CTDHL+/I"
X-Original-To: kernel-janitors@vger.kernel.org
X-Greylist: delayed 557 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Nov 2023 05:48:42 PST
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a0c:4d80:42:2001::664])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFC1A0;
	Thu, 16 Nov 2023 05:48:42 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1700141962; bh=xz/iIZuRY8Op5WtoC1hs7ryH78Y6fd9GbW1inUZsj3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CTDHL+/IzwlYYfT58IfEP+UsddbyIZ9mdusYQH+NvNEqXFUTGdZZtBE7T6+QFtrlw
	 48Gu2yY92JWcInAMHeTbZwuhpjHvkUeRUmyOZJ9IfNr4IC5ZUbAjDVWhinxqB1NHsk
	 5UTCD2YcUNI2M1Q4DAUIbgrGaRSCnB8e0u6QVI5ATYK8g5ttO8E6ZodsU38KF0OhPT
	 3mZMgSdASmET9BYE4k+iN70F5qAhsDw3odiBiRkbNjTwSy2vEakHTpL7Db/pUtFPB0
	 RRv7ceCoyyz/SwNk94NXWITaVPwVpggpmLHltTv/KpBXFYcD+iiQR7eV+yRbDdUBKg
	 ysi6eWVgYQjpQ==
To: Wu Yunchuan <yunchuan@nfschina.com>, kvalo@kernel.org, afaerber@suse.de,
 mani@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Wu Yunchuan <yunchuan@nfschina.com>
Subject: Re: [PATCH v2 wireless-next 9/9] wifi: ath9k: Remove unnecessary
 (void*) conversions
In-Reply-To: <20230919045226.524544-1-yunchuan@nfschina.com>
References: <20230919045226.524544-1-yunchuan@nfschina.com>
Date: Thu, 16 Nov 2023 14:39:22 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87o7ftddh1.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Wu Yunchuan <yunchuan@nfschina.com> writes:

> No need cast (void *) to (struct owl_ctx *), (struct ath_hw *),
> (struct cmd_buf *) or other types.
>
> Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>

