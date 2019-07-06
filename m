Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1EB6132A
	for <lists+kernel-janitors@lfdr.de>; Sun,  7 Jul 2019 00:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfGFWpN (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 6 Jul 2019 18:45:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45005 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbfGFWpM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Jul 2019 18:45:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so5787396pgl.11
        for <kernel-janitors@vger.kernel.org>; Sat, 06 Jul 2019 15:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=KZuwwpEDFFidTZvCB013aANFUOOg31tF9n5M77JSn6w=;
        b=L2olCuuAvGq0806TGK59wMZhuTO9EVAfk3ga/cDt+R/5EhMP0+heHReCNlnPQDSkGp
         zGOPzi9ERGBvpgjYMxEVfHRrpbbXjbg9Tumnson9Aj9d9S6tOlEMiXFMwzktp7ZoFa3j
         3V4SxfHzDv2eIU000+5AZUoa1Vtg/lRF68Rlt5ugGh4CRwA4IKmmpjhUDLoci2ZaePqX
         HSR3SKOK5gu0GgWUlM9Rx0PxavwGWVtiwv6Ta5AOjENY0n47KgVxkOLu73lQUOx9c9sL
         IpfijZ2PChnxS65QjOoFAk9wJ0S9i/zj+e2Oc8PK+C/M1rSSj52DmRST89qhWX1QIG1e
         nXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=KZuwwpEDFFidTZvCB013aANFUOOg31tF9n5M77JSn6w=;
        b=oo3wgaaj66vMcDmwX0Wj2tAacTsQ2OjWhQVTM5e6qUyMR58elQqmjIUQLRVHdPhsQA
         QOZurjd9vxBkSdNcTwGhbETwK8kYPg0h+aTmuxJmzpim9jyhk3QAuG/ADQSGamKYTSer
         zyYrZriCNIli3QADsWu2rcgDU/WnYpCHQN7S2PLN9OE/H2budubXN2/HIPgVBNU8M/YK
         MCj+ekt6cA5vMQCeTvqoN5ymSTKw6Pw+QBFbJPNimiI9m62tgPs0mmu6kGK+abIVC6mm
         6D5RbOUULLORemjeAz1lP7vlJnhFWryoX01YMrYtEK9mjeO1VrC26xJePO0JT2fV90sD
         dvJA==
X-Gm-Message-State: APjAAAUrxubJ0xZ3QFHX3fOpml0liHjIEZiZ4W4KHm7YM0NR8Wr88huv
        mSBXoxGxBDon03CmwmoQuhck4Z/yEQ0=
X-Google-Smtp-Source: APXvYqy99zQ1u6U2AvHd71woEPV1gm8EDjjXuQvomJnzfLlJWwx2tPqF1zsuElqnQVfiPN3ciDpYHg==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id d20mr14263697pjw.28.1562453111723;
        Sat, 06 Jul 2019 15:45:11 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id n17sm13000168pfq.182.2019.07.06.15.45.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 15:45:10 -0700 (PDT)
Date:   Sat, 6 Jul 2019 15:45:10 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Christopher Lameter <cl@linux.com>
cc:     Markus Elfring <Markus.Elfring@web.de>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Pekka Enberg <penberg@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/slab: One function call less in
 verify_redzone_free()
In-Reply-To: <0100016bc3579800-ee6cd00b-6f59-4d86-be0c-f63e2b137d18-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.1907061542480.103032@chino.kir.corp.google.com>
References: <c724416e-c8bc-6927-00c5-7a4c433c562f@web.de> <0100016bc3579800-ee6cd00b-6f59-4d86-be0c-f63e2b137d18-000000@email.amazonses.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 5 Jul 2019, Christopher Lameter wrote:

> On Fri, 5 Jul 2019, Markus Elfring wrote:
> 
> > Avoid an extra function call by using a ternary operator instead of
> > a conditional statement for a string literal selection.
> 
> Well. I thought the compiler does that on its own? And the tenary operator
> makes the code difficult to read.
> 

Right, and I don't understand the changelog: yes, there's one less 
function call in the source but functionally there's still a conditional; 
this isn't even optimizing DEBUG builds.
