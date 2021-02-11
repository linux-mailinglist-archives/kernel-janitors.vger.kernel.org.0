Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C3C319040
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Feb 2021 17:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhBKQnz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Feb 2021 11:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhBKQlx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Feb 2021 11:41:53 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C913DC061756
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Feb 2021 08:41:12 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6405C4EB3;
        Thu, 11 Feb 2021 16:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6405C4EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613061553; bh=D0AEZkZBdtIfK0g+dvBXWwh92CNH+OXOsoawWY81IkA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jVzO3l39uQAncbOmMLDb05auJMJvZOoWtiwhFe7qRYs548PXCRuvtX7TOm0qMVKTo
         cCP44/tY67JeIyrWv1oDVAOY0awDEUhifbBaztXZfQOCAPahyewarvVMswLF2Ki8DT
         zzsyolXWsM4lPcS6RwH2Uk/xFZipA7HZ060Dx1vxc8DpsEtTkXdKjPw/8aFyFEFxph
         Wr12poLG7r/4KRg2AzzRmRHGy+VV27+zrCP3ArBCJkMdXFn1dh6aq7yj2/N2yLeoqp
         sOVOjnYVKQQcTDNtxr2QZKa1aur+/jR/YxnpvEsMhJ5ph6tB45509Yrd8LXuxGj21P
         MpZhz2DaK4oWg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Colin King <colin.king@canonical.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexey Budankov <alexey.budankov@linux.intel.com>,
        linux-doc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc/admin-guide: fix spelling mistake: "perfomance" ->
 "performance"
In-Reply-To: <20210210115624.53551-1-colin.king@canonical.com>
References: <20210210115624.53551-1-colin.king@canonical.com>
Date:   Thu, 11 Feb 2021 09:39:12 -0700
Message-ID: <875z2yr233.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the perf-security documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  Documentation/admin-guide/perf-security.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
> index 904e4eb37f99..34aa334320ca 100644
> --- a/Documentation/admin-guide/perf-security.rst
> +++ b/Documentation/admin-guide/perf-security.rst
> @@ -72,7 +72,7 @@ monitoring and observability operations, thus, bypass *scope* permissions
>  checks in the kernel. CAP_PERFMON implements the principle of least
>  privilege [13]_ (POSIX 1003.1e: 2.2.2.39) for performance monitoring and
>  observability operations in the kernel and provides a secure approach to
> -perfomance monitoring and observability in the system.
> +performance monitoring and observability in the system.

Applied, thanks.

jon
