Return-Path: <kernel-janitors+bounces-8558-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8CDAFDB4A
	for <lists+kernel-janitors@lfdr.de>; Wed,  9 Jul 2025 00:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A7E4E5784
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Jul 2025 22:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A71A1DDA18;
	Tue,  8 Jul 2025 22:48:10 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from sxb1plsmtpa01-05.prod.sxb1.secureserver.net (sxb1plsmtpa01-05.prod.sxb1.secureserver.net [188.121.53.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF628220F33
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Jul 2025 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752014889; cv=none; b=G0YpEiPSD4yW9Xq7ON1/fMJSW+5yVUdtiQjXKU4FaSV+ASSLmCXIRBqmunlzNo4pG41vzDvJT/hl4SMQO5J77S5OhfV7JXVDIGaZ0XWlxpwEaxYe08XZ45Y0f3vnQ/mKbnEIbIglvJlPzE9R7SbuUfdNyXVWSbhWY3r8Yy/12HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752014889; c=relaxed/simple;
	bh=NDIxyMy96oaGTIrC7fMq8LGGd1EB5Tkke6BGzWzJnzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+2968nAaUAFzj9aOZILx5okVgxSybBhdO/S/VtabrTZYp45vYkMhXVQg/8jKjPa4YP0rhdvjNuSUpyqCSSMhKaTUdPwTJWYqwPYJ4BnfuB63uFsRykGUXsqNsQxZKjDdIV5MiFghoxCxShptPJjP4qpzrRhLQRuSjyByrsViMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id ZDdBuA7VzdDAfZDdDueRZi; Tue, 08 Jul 2025 12:05:32 -0700
X-CMAE-Analysis: v=2.4 cv=GKgIEvNK c=1 sm=1 tr=0 ts=686d6bfc
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=FXvPX3liAAAA:8 a=ry9jMNirEf-YdYR-n9AA:9
 a=QEXdDO2ut3YA:10 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <47a56ddc-eedc-40f4-a7a1-1aeea6224e1c@squashfs.org.uk>
Date: Tue, 8 Jul 2025 20:05:10 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] squashfs: Fix incorrect argument to sizeof in
 kmalloc_array call
To: Colin Ian King <colin.i.king@gmail.com>, Chanho Min <chanho.min@lge.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20250708142604.1891156-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250708142604.1891156-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE4N1qyTbEDZ4KaQ9qaUZcHEctV6RDBOcmAnJTGpeK9qA4ZJAu80Ugb0XZlDdc8v8QkePRcVI0UsoQa+3poA1bbizzjXlAGZYPIfaErY0UkKgkVTCtVV
 Hknaw2pRwPpQOH6bCfSBXkl02h50MmcRkwhhAmlsBGxAfZGQJ1o9ckXk3viZWTqgaqTNyG7++7BwdBdi+VqcxV7gZ85Ndg/h8ytX0upX6dpr325kjpp34M87
 FYloTVm92jdLxtM2njQhq6hvOoAyMB4Rre/QeNd7NtcdnX5laFuVRjw6b17kbHS9uqqsibLsTZtqa5i8cl5Kf+wc2w2f5Evb3dkkAVup0s3AuNV3eOu9M2wG
 rFB6TRoz

On 08/07/2025 15:26, Colin Ian King wrote:
> The sizeof(void *) is the incorrect argument in the kmalloc_array call,
> it best to fix this by using sizeof(*folio) instead. Fortunately the
> sizes of void * and *folio happen to be the same, so this has not shown
> up as a run time issue.
> 
> Fixes: 2e227ff5e272 ("squashfs: add optional full compressed block caching")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>

> ---
>   fs/squashfs/block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
> index b3ae3b1cc0e5..00049b7b10c8 100644
> --- a/fs/squashfs/block.c
> +++ b/fs/squashfs/block.c
> @@ -89,7 +89,7 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
>   	int err = 0;
>   #ifdef CONFIG_SQUASHFS_COMP_CACHE_FULL
>   	struct folio **cache_folios = kmalloc_array(page_count,
> -			sizeof(void *), GFP_KERNEL | __GFP_ZERO);
> +			sizeof(*folio), GFP_KERNEL | __GFP_ZERO);
>   #endif
>   
>   	bio_for_each_folio_all(fi, fullbio) {

