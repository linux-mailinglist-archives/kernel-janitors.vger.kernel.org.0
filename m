Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570517A6C94
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Sep 2023 22:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbjISU57 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Sep 2023 16:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbjISU5y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 16:57:54 -0400
Received: from out-226.mta1.migadu.com (out-226.mta1.migadu.com [IPv6:2001:41d0:203:375::e2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D63BF
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 13:57:48 -0700 (PDT)
Date:   Tue, 19 Sep 2023 16:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695157064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dUzytAnhwgObCiX8I6ziFJCuYWaJ7gTxd1shipbnUp0=;
        b=JS1ejar30W8c9Fqx1SK6dbp8sGZVX2b3gVWBUe9dgu0FC9HP9e4D1ozUP6gKCcW25iupn1
        mb1PJf0ACY4751ApXrL4zlLOtODucGIKhXMYS2RGJGH+SOJ3X0vhbfq33SdZB4pbZJc4uG
        iBJlhRZPVb9Bcf+MxMy5y2mjCMItG6E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        Brian Foster <bfoster@redhat.com>,
        linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] bcachefs: acl: Uninitialized variable in
 bch2_acl_chmod()
Message-ID: <20230919205741.j2ttqwksk5ipumjc@moria.home.lan>
References: <ce3a4798-f467-4776-939b-b094c365cc5c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3a4798-f467-4776-939b-b094c365cc5c@moroto.mountain>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 15, 2023 at 03:55:40PM +0300, Dan Carpenter wrote:
> The clean up code at the end of the function uses "acl" so it needs
> to be initialized to NULL.
> 
> Fixes: 53306e096d91 ("bcachefs: Always check for transaction restarts")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, applied
