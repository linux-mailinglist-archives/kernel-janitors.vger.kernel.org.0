Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9422DAB6E
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Dec 2020 11:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbgLOKu6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Dec 2020 05:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgLOKuR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Dec 2020 05:50:17 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E953C061282;
        Tue, 15 Dec 2020 02:49:03 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4CwFP90V7mz9sVM; Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Colin King <colin.king@canonical.com>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201207155420.172370-1-colin.king@canonical.com>
References: <20201207155420.172370-1-colin.king@canonical.com>
Subject: Re: [PATCH] powerpc: fix spelling mistake in Kconfig "seleted" -> "selected"
Message-Id: <160802920673.504444.13601215684567124032.b4-ty@ellerman.id.au>
Date:   Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 7 Dec 2020 15:54:20 +0000, Colin King wrote:
> There is a spelling mistake in the help text of the Kconfig. Fix it.

Applied to powerpc/next.

[1/1] powerpc: fix spelling mistake in Kconfig "seleted" -> "selected"
      https://git.kernel.org/powerpc/c/f8a4b277c3cf39ec8efe50114924a7743cc84800

cheers
