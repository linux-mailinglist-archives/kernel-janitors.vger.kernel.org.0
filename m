Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7AF31662D
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Feb 2021 13:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhBJMLk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 10 Feb 2021 07:11:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:43852 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231599AbhBJMJY (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Feb 2021 07:09:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 378B0AFBF;
        Wed, 10 Feb 2021 12:08:40 +0000 (UTC)
Date:   Wed, 10 Feb 2021 13:08:39 +0100 (CET)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] module: potential uninitialized return in
 module_kallsyms_on_each_symbol()
In-Reply-To: <YCO8AwE57IzaMamG@mwanda>
Message-ID: <alpine.LSU.2.21.2102101307030.14803@pobox.suse.cz>
References: <YCO8AwE57IzaMamG@mwanda>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 10 Feb 2021, Dan Carpenter wrote:

> Smatch complains that:
> 
> 	kernel/module.c:4472 module_kallsyms_on_each_symbol()
>         error: uninitialized symbol 'ret'.
> 
> This warning looks like it could be correct if the &modules list is
> empty.
> 
> Fixes: 013c1667cf78 ("kallsyms: refactor {,module_}kallsyms_on_each_symbol")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Miroslav Benes <mbenes@suse.cz>

M
