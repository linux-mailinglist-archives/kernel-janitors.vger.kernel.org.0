Return-Path: <kernel-janitors+bounces-251-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F17E9BDA
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 13:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C111B20ACC
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 12:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48711D553;
	Mon, 13 Nov 2023 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gO/lyOKd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F881D52A
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 12:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EDFC433C7;
	Mon, 13 Nov 2023 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699877266;
	bh=4wlY34yA/NZoVOF4oQbm/htpzM60UGkfAML7KHwXaGU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gO/lyOKd01bzEtI6LD3gxYSWc6gN8ceTyt2G2v9lWamYWLFm/8xlAtK6FZCm8kxVk
	 7i+CY5CRGp2lnuLTvsan4I1ezH1x3CFqs2PJGelbiADnfpqmqEyb7PkdOEFiOtQR4K
	 iC07cLNRDQOibB/tN2rNSkQ5mAwSMdgvzH/8oeOXA68umYmziLnbYMK4byAKzHD8/v
	 0k6UvB7ltHjkl71ATPPl2bldlDlsE6PryiM4P0yzKmFVhJtnmrFMivZWVpFejNYlQ6
	 Qy4HORXFDTpxSXBTSzOejmD5n5K/UVWqLNu2k0H4HJyEBQhU+9Fgi0BI5BCbo9zc47
	 qDhpN3l1djhfw==
From: Kalle Valo <kvalo@kernel.org>
To: Su Hui <suhui@nfschina.com>
Cc: linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless-next] wlcore: debugfs: add an error code check
 in beacon_filtering_write
References: <065d6090-38fc-0cc0-db47-f9ba5b1c5d7d@nfschina.com>
Date: Mon, 13 Nov 2023 14:07:43 +0200
In-Reply-To: <065d6090-38fc-0cc0-db47-f9ba5b1c5d7d@nfschina.com> (Su Hui's
	message of "Mon, 13 Nov 2023 14:53:28 +0800")
Message-ID: <878r71vots.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Su Hui <suhui@nfschina.com> writes:

> On 2023/11/13 14:16, Kalle Valo wrote:
>
>> Su Hui <suhui@nfschina.com> writes:
>>
>>> wl1271_acx_beacon_filter_opt() return error code if failed, add a check
>>> for this is better and safer.
>>>
>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> How did you test this?
>
> Only compile test.

If you have only compile tested please document that clearly in the
commit message.

> Clang static checker complains about this code that=C2=A0 value stored to
> 'ret' is never read.

This would be good to also have in the commit message.

> And most of the caller check=C2=A0 the error code of
> wl1271_acx_beacon_filter_opt().

This might still break something so I would prefer to test this in a
real device before taking it.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

